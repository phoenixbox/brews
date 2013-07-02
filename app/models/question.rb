class Question < ActiveRecord::Base
  attr_accessible :correct_answer, :current, :game_id, :order, :points, :text, :user_id, :id, :status

  has_many :submissions
  belongs_to :game

  validates :text,
            :presence => true,
            :uniqueness => true

  validates :correct_answer, :presence => true

  def activate
    self.update_attribute(:current, true)
  end

  def reset
    self.status = "incomplete"
    self.save
  end

  def mark_as_complete
    self.current = false
    self.status = "complete"
    self.save
  end

  def next
    game.questions.where(status: "incomplete").first
  end

  def next_text
    if self.next
      self.next.text
    else
      "No active questions."
    end
  end

end
