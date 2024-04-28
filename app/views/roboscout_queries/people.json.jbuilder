json.people(@people) do |person|
  json.extract! person, :id, :first_name, :last_name, :publication_count
  json.relevance_score rand
end
