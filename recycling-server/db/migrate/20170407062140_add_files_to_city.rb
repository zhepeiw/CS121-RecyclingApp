class AddFilesToCity < ActiveRecord::Migration[5.0]
  def change
    add_column :cities, :files, :json
  end
end
