class CreateJoinTableCitiesFacilities < ActiveRecord::Migration[5.0]
  def change
    create_join_table :cities, :facilities, table_name: :has_facilities do |t|
      t.index :city_id
      t.index :facility_id
    end
  end
end
