class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.text :description
      t.string :image_link
      t.integer :recycle_class
      # 1 represents recyclables
      # 2 represents compost
      # 3 represents biodegradable
      # 4 represents electronics waste
      # 5 represents hazardous waste

      t.timestamps
    end
    add_index :categories, :name, unique: true
  end
end
