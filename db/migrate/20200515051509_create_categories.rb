class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :genre,null: false

      t.timestamps
    end
    add_index :categories, :genre
  end
end
