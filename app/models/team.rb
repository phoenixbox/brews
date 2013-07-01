class Team < ActiveRecord::Base
  attr_accessible :title
  has_many :submissions
  belongs_to :game

  def update_score
    corrects = submissions.where(correct: true)
    scores = corrects.map do |submission|
      submission.question.points
    end
    self.points = scores.inject(0, :+)
    save
  end

end
