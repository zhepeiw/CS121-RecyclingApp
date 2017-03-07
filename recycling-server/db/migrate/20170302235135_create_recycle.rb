class CreateRecycle < ActiveRecord::Migration[5.0]
  def change
    create_table :recycles do |t|
      # t.index [:city_id, :subcategory_id]
      t.belongs_to :cities, index: true, foreign_key: true
      t.belongs_to :subcategories, index: true, foreign_key: true
      # t.index [:subcategory_id, :city_id]
    end
  end
end
