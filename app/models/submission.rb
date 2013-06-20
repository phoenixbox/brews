class Submission < ActiveRecord::Base
  attr_accessible :question_id, :content, :correct, :team_id

  validates :content, :presence => true
  validates :question_id, :presence => true

  def current_question
    the_question_id = @submission.question_id
    Question.find_by_id(the_question_id)
  end

  def current_question_text
    current_question.text
  end

  def current_answer
    current_question.correct_answer
  end

  def match_finder
    fuzzy = FuzzyMatch.new(current_answer)
    fuzzy.find('#{@submission.content}')
  end

end
