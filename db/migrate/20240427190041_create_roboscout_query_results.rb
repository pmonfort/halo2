class CreateRoboscoutQueryResults < ActiveRecord::Migration[7.0]
  def change
    create_table :roboscout_query_results do |t|
      t.references :roboscout_query, foreign_key: true, index: true
      t.timestamps
    end
  end
end
