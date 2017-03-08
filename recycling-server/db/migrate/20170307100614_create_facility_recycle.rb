class CreateFacilityRecycle < ActiveRecord::Migration[5.0]
  def change
    create_join_table :facilities, :categories, table_name: :facility_recycles
    add_index :facility_recycles, [:facility_id, :category_id], unique: true
  end
end
