class AddRecycleToCity < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :recycles, :cities, column: :city_id, primary_key: :id, on_delete: :cascade
    add_foreign_key :recycles, :subcategories, column: :subcategory_id, primary_key: :id, on_delete: :cascade
  end
end
