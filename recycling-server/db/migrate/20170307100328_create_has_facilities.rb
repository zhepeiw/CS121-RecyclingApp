class CreateHasFacilities < ActiveRecord::Migration[5.0]
  def change
    create_join_table :cities, :facilities, table_name: :has_facilities
    add_index :has_facilities, [:city_id, :facility_id], unique: true
  end
end
