class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.text :description
      t.string :image_link
      t.string :recycle_class # Five digit string, "abcde"
                              # a represents recyclables
                              # b represents compost
                              # c represents biodegradable
                              # d represents electronics waste
                              # e represents hazardous waste

      t.timestamps
    end
    add_index :categories, :name, unique: true
  end
end
