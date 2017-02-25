class EditUserTableColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :is_farmer?
    add_column :users, :is_farmer, :boolean
  end
end
