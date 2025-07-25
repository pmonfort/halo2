json.people(@roboscout_query_people) do |roboscout_query_person|
  json.extract! roboscout_query_person.person,
                :id,
                :first_name,
                :last_name,
                :publication_count
  json.relevance roboscout_query_person.relevance
end
