class Submission < ActiveRecord::Base
  attr_accessible :question_id, :content, :correct, :team_id
end
