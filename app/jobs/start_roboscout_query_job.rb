# typed: true
# frozen_string_literal: true

class StartRoboscoutQueryJob < ApplicationJob
  extend T::Sig
  include Sidekiq::Job

  AUTHOR_LIMIT = 8

  sig { params(query_id: Integer).void }
  def perform(query_id)
    query = RoboscoutQuery.find_by(id: query_id)
    return if query.nil?

    open_alex = OpenAlex.new
    works_response = open_alex.search(T.must(query.query)) || []

    author_match_counts = Hash.new(0)
    works_response['results'].each do |work|
      work['authorships']&.each do |authorship|
        author_id = authorship['author']&.[]('id')

        next if author_id.nil?

        author_match_counts[author_id] += 1
      end
    end

    # Take up to 8 authors, most relevant first (most appearances in matching works)
    author_ids_by_relevance = author_match_counts
      .sort_by { |_id, count| -count }
      .first(AUTHOR_LIMIT)
      .map(&:first)
      
    author_ids_by_relevance.each do |author_id|
      author_data = open_alex.author(author_id)
      person = find_or_create_person(author_id, author_data)
      relevance = author_match_counts[author_id].to_f

      rqp = query.roboscout_query_person.find_or_initialize_by(person: person)
      rqp.relevance = relevance
      rqp.save!

      add_publications_for_person(open_alex, person, author_id)

      sleep 0.2
    end
      
    query.update!(status: 'complete')
  end

  private

  sig { params(author_id: String, author_data: T::Hash[String, T.untyped]).returns(Person) }
  def find_or_create_person(author_id, author_data)
    display_name = author_data['display_name'] || 'Unknown'
    first_name, last_name = split_display_name(display_name)

    Person.find_or_create_by!(openalex_id: author_id) do |p|
      p.first_name = first_name
      p.last_name = last_name
    end
  end

  sig { params(display_name: String).returns([String, String]) }
  def split_display_name(display_name)
    parts = display_name.strip.split(/\s+/)
    if parts.size <= 1
      [parts.first || 'Unknown', '']
    else
      [parts[0..-2].join(' '), parts.last]
    end
  end

  sig { params(open_alex: OpenAlex, person: Person, author_id: String).void }
  def add_publications_for_person(open_alex, person, author_id)
    works_response = open_alex.author_works(author_id)
    works = works_response['results'] || []

    works.each do |work|
      openalex_work_id = extract_work_id(work['id'])
      next if openalex_work_id.blank?

      next if person.publications.exists?(openalex_id: openalex_work_id)

      abstract = work['abstract_inverted_index']
      abstract_text = abstract.is_a?(Hash) ? abstract.keys.join(' ') : nil
      published_at = parse_publication_date(work['publication_date'])

      person.publications.create!(
        openalex_id: openalex_work_id,
        title: work['title'],
        abstract: abstract_text,
        published_at: published_at
      )
    end
  end

  sig { params(work_url: T.nilable(String)).returns(T.nilable(String)) }
  def extract_work_id(work_url)
    return nil if work_url.blank?

    work_url.split('/').last.presence
  end

  sig { params(date_str: T.nilable(String)).returns(T.nilable(Date)) }
  def parse_publication_date(date_str)
    return nil if date_str.blank?

    Date.parse(date_str)
  rescue ArgumentError
    nil
  end
end
