class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :question_id
      t.string :content
      t.integer :team_id
      t.boolean  :correct
      t.timestamps
    end
  end
end
