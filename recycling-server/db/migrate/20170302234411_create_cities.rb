class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.string :state, null: false
      t.string :zipcode, null: false
      t.text :description
      t.string :image_link

      t.timestamps
    end
  end
end
