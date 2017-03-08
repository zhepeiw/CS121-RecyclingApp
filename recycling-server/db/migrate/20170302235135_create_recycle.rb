class CreateRecycle < ActiveRecord::Migration[5.0]
  def change
    create_join_table :cities, :subcategories, table_name: :recycles
    add_index :recycles, [:city_id, :subcategory_id], unique: true
  end
end
