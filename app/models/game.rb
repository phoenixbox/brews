class Game < ActiveRecord::Base
  attr_accessible :pin, :question_time, :title

  belongs_to :user

  def current_user?(current_user_id)
    user_id == current_user_id
  end
end
