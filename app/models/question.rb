class Question < ActiveRecord::Base
  attr_accessible :correct_answer, :current, :game_id, :order, :points, :text, :user_id, :id, :status

  has_many :submissions
  belongs_to :game

  validates :text,
            :presence => true,
            :uniqueness => true

  validates :correct_answer, :presence => true

  def activate
    self.current = true
    self.save
  end

  def reset
    self.status = "incomplete"
    self.save
  end

  def next
    self.current = false
    self.status = "complete"
    self.save
    next_question = game.questions.where(status: "incomplete").first
    if next_question
      next_question.activate
    else
      game.complete
    end
    #return next_question
  end

end
