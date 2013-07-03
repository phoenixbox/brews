class Submission < ActiveRecord::Base
  attr_accessible :question_id, :content, :correct, :team_id, :response

  validates :question_id, :presence => true
  validates_length_of :content, :maximum => 55
  belongs_to :question
  belongs_to :team

  def self.save_and_score(params, team_id)
    question = Question.find(params["question_id"])
    content = params["content"]
    fuzzy = FuzzyMatchComparison.new(question.correct_answer, content)
    s = self.create do |s|
      s.correct = fuzzy.score_points?
      s.question_id = question.id
      s.content = content
      s.team_id = team_id
      s.response = fuzzy.answer_response
    end
  end

end
