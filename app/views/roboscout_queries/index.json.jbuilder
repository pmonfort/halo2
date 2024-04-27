json.roboscout_queries(@roboscout_queries) do |query|
  json.extract! query, :id, :query, :status, :result_count
end
