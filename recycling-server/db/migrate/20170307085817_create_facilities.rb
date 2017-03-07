class CreateFacilities < ActiveRecord::Migration[5.0]
  def change
    create_table :facilities do |t|
      t.string :name, null: false
      t.string :street_address
      t.string :zipcode
      t.string :phone_number
      t.string :website

      t.timestamps
    end
    add_index :facilities, :street_address, unique: true
  end
end
