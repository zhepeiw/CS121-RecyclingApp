class CreateRecycles < ActiveRecord::Migration[5.0]
  def change
    create_table :recycles do |t|
      t.integer :city_id, null: false
      t.integer :subcategory_id, null: false

      t.timestamps
    end
  end
end
