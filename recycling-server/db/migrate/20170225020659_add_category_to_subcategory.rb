class AddCategoryToSubcategory < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :subcategories, :categories, column: :category_id, primary_key: :id, on_delete: :cascade
  end
end
