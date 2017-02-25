class CreateSubcategories < ActiveRecord::Migration[5.0]
  def change
    create_table :subcategories do |t|
      t.string :name, null: false
      t.text :description
      t.string :image_link
      t.integer :category_id, null: false
      
      t.timestamps
    end
  end
end
