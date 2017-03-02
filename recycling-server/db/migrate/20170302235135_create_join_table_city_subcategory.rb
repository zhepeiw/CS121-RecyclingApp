class CreateJoinTableCitySubcategory < ActiveRecord::Migration[5.0]
  def change
    create_join_table :cities, :subcategories, table_name: :recycles do |t|
      t.index [:city_id, :subcategory_id]
      # t.index [:subcategory_id, :city_id]
    end
  end
end
