class Submission < ActiveRecord::Base
  attr_accessible :question_id, :content, :correct, :team_id

  validates :content, :presence => true
  validates :question_id, :presence => true

  belongs_to :question

  def match_finder
    fuzzy = FuzzyMatch.new(@question.correct_answer).find(@submission.content)
  end

  # def answer_setter
  #   if match_finder == nil
  #     submission = Submission.find_by_id(@submission.id)
  #     submission.correct == false
  #     submission.save
  #   else
  #     submission = Submission.find_by_id(@submission.id)
  #     submission.correct == true
  #     submission.save
  #   end
  # end

  def good_speller
    @question.correct_answer.upcase == @submission.content.upcase
  end

  def bad_speller
    @question.correct_answer.upcase != @submission.content.upcase
  end
end
