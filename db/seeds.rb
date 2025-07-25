# typed: true

query_1 =
  RoboscoutQuery.find_or_create_by!(
    query: 'pigmentation removal from thermoplastics recycling',
    status: 'complete'
  )

10.times do
  query_1.roboscout_query_person.create!(
    person:
      Person.create!(
        first_name: FFaker::Name.first_name,
        last_name: FFaker::Name.last_name,
        publications:
          rand(3..5).times.map do
            Publication.new(
              title: FFaker::Lorem.sentence,
              abstract: FFaker::Lorem.paragraph
            )
          end
      ),
    relevance: rand
  )
end

query_2 =
  RoboscoutQuery.find_or_create_by!(
    query: 'pigmentation removal from thermoplastics recycling',
    status: 'in_progress'
  )
