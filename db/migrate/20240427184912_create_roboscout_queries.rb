class CreateRoboscoutQueries < ActiveRecord::Migration[7.0]
  def change
    create_table :roboscout_queries do |t|
      t.text :query
      t.string :status
      t.timestamps
    end
  end
end
