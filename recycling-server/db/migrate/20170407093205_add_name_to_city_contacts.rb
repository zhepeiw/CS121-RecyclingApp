class AddNameToCityContacts < ActiveRecord::Migration[5.0]
  def change
    remove_column :city_contacts, :phone
    remove_column :city_contacts, :email
    add_column :city_contacts, :name, :string, :null => false
    add_column :city_contacts, :contact, :string, :null => false
  end
end
