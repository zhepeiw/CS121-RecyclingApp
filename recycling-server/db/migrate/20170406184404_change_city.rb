class ChangeCity < ActiveRecord::Migration[5.0]
  def change
    add_column :cities, :uid, :string, { :null => false }
    add_column :cities, :website, :string, { :null => true }
  end
end
