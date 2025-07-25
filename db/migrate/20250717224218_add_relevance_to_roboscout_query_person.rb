class AddRelevanceToRoboscoutQueryPerson < ActiveRecord::Migration[7.1]
  def change
    add_column :roboscout_query_people, :relevance, :float
  end
end
