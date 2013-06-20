class Question < ActiveRecord::Base
  attr_accessible :correct_answer, :current, :game_id, :order, :points, :text, :user_id

  validates :text,
            :presence => true,
            :uniqueness => true

  validates :correct_answer, :presence => true
  validates :order, :presence => true
end
