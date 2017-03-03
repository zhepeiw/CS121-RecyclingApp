class CreateSubcategories < ActiveRecord::Migration[5.0]
  def change
    create_table :subcategories do |t|
      t.string :name, null: false
      t.text :description
      t.string :image_link

      t.belongs_to :category, index: true, foreign_key: true
      t.timestamps
    end
    add_index :subcategories, :name, unique: true
  end
end
