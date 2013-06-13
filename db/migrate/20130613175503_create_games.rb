class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :pin
      t.string :admin_pin
      t.integer :question_time

      t.timestamps
    end
  end
end
