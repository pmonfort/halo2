# typed: true
# frozen_string_literal: true

class StartRoboscoutQueryJob < ApplicationJob
  extend T::Sig
  include Sidekiq::Job

  sig { params(query_id: Integer).void }
  def perform(query_id)
    query = RoboscoutQuery.find_by(id: query_id)
    return if query.nil?

    # TODO: Start the search.
    # See app/services/open_alex.rb for calling the API.
    open_alex = OpenAlex.new
    works_response = open_alex.search(T.must(query.query))

    # Replace this loop with the correct logic.
    works_response['results'].each do |work|
      puts "Found work: #{work['id']} #{work['title']}"
    end

    # Example of getting the author's works.
    open_alex.author_works('A5080765172')

    # Example of add the person to the query.
    query.roboscout_query_person.create!(
      person: Person.create!(first_name: 'John', last_name: 'Doe'),
      relevance: 0.5
    )

    open_alex.close
    query.update!(status: 'complete')
  end
end
