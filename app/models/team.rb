class Team < ActiveRecord::Base
  attr_accessible :title

  has_many :submissions

end
