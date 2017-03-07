class CreateJoinTableFacilitiesCategories < ActiveRecord::Migration[5.0]
  def change
    create_join_table :facilities, :categories, table_name: :facility_recycles do |t|
      t.index :facility_id
      t.index :category_id
    end
  end
end
