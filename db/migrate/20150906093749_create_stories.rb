class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.text :description
      t.string :company
      t.string :url

      t.timestamps null: false
    end
  end
end
