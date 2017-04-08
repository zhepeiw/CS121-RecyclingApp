class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :city, :string
    add_column :users, :name, :string
    add_column :users, :state, :string
    add_column :users, :job_title, :string
  end
end
