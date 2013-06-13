class Game < ActiveRecord::Base
  attr_accessible :pin, :question_time, :title
end
