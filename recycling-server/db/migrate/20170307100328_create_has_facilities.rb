class CreateHasFacilities < ActiveRecord::Migration[5.0]
  def change
    create_table :has_facilities do |t|
      t.belongs_to :cities, index: true, foreign_key: true
      t.belongs_to :facilities, index: true, foreign_key: true
    end
  end
end
