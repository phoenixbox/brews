class RemoveAdminPinFromGame < ActiveRecord::Migration
  def change
    remove_column :games, :admin_pin
  end
end