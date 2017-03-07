class CreateFacilityRecycle < ActiveRecord::Migration[5.0]
  def change
    create_table :facility_recycles do |t|
      t.belongs_to :facilities, index: true, foreign_key: true
      t.belongs_to :categories, index: true, foreign_key: true
    end
  end
end
