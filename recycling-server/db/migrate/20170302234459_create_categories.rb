class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false, unique: true
      t.text :description
      t.string :image_link

      t.timestamps
    end
  end
end
