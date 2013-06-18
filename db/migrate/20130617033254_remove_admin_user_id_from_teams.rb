class RemoveAdminUserIdFromTeams < ActiveRecord::Migration
  def change
    remove_column :teams, :admin_user_id
  end
end
