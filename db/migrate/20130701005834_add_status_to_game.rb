class AddStatusToGame < ActiveRecord::Migration
  def change
    add_column :games, :status, :string, :default => "incomplete"
  end
end
