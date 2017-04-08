class CreateCityContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :city_contacts do |t|
      t.string :phone
      t.string :email

      t.belongs_to :city, index: true, foreign_key: true
    end
  end
end
