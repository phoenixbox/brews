class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :text
      t.string :correct_answer
      t.integer :user_id
      t.integer :game_id
      t.integer :order
      t.boolean :current
      t.integer :points

      t.timestamps
    end
  end
end
