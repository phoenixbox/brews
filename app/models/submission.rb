class Submission < ActiveRecord::Base
  attr_accessible :question_id, :content, :correct, :team_id

  validates :content, :presence => true
  validates :question_id, :presence => true

  belongs_to :question

  def the_answer
    @question.correct_answer
  end

  def your_answer
    @submission.content
  end

  def match_finder
    fuzzy = FuzzyMatch.new(the_answer)
    fuzzy.find(your_answer)
  end

  def answer_setter
    if match_finder == nil
      submission = Submission.find_by_id(@submission.id)
      submission.correct == false
      submission.save
    else
      submission = Submission.find_by_id(@submission.id)
      submission.correct == true
      submission.save
    end
  end

  def good_speller
    the_answer.upcase == your_answer.upcase
  end

  def bad_speller
    the_answer.upcase != your_answer.upcase
  end
end
