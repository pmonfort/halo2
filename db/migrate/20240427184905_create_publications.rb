class CreatePublications < ActiveRecord::Migration[7.0]
  def change
    create_table :publications do |t|
      t.references :person, index: true
      t.text :abstract
      t.text :title
      t.date :published_at
      t.string :openalex_id
      t.timestamps
    end
  end
end
