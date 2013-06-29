class Submission < ActiveRecord::Base
  attr_accessible :question_id, :content, :correct, :team_id

  validates :content, :presence => true
  validates :question_id, :presence => true

  belongs_to :question
  belongs_to :team

  # def answer_setter
  #   if @fuzzy < 0.9
  #     submission = Submission.find_by_id(submission.id)
  #     submission.correct == false
  #     submission.save
  #   elsif @fuzzy > 0.9
  #     submission = Submission.find_by_id(@submission.id)
  #     submission.correct == true
  #     submission.save
  #   end
  # end
end
