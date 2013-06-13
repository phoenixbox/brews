class Game < ActiveRecord::Base
  attr_accessible :admin_pin, :pin, :question_time, :title
end
