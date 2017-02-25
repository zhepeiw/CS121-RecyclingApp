class AddRecycleToCity < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :Recycles, :Cities, column: :city_id, primary_key: :id, on_delete: :cascade
    add_foreign_key :Recycles, :Subcategories, column: :subcategory_id, primary_key: :id, on_delete: :cascade
  end
end
