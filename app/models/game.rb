class Game < ActiveRecord::Base
  attr_accessible :pin, :question_time, :title

  has_many :questions
  has_many :teams
  belongs_to :user

  def complete
    self.active = false
    self.status = "complete"
    self.save
  end

  def current_user?(current_user_id)
    user_id == current_user_id
  end

  def current_question
    question = questions.where(status: "incomplete").first
    if question
      question.activate
      question
    end
  end

  def reset_questions
    questions.each do |question|
      question.reset
    end

    questions.first.activate
  end
end
