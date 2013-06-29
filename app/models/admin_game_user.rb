class AdminGameUser

  attr_reader :user, :game

  def initialize(user_id, game_id)
    @user = User.find(user_id)
    @game = Game.find(game_id)
  end

  def title
    "Admin Mode"
  end

  def display_name
    user.title
  end

  def title_2
    "Pin"
  end

  def info_2
    game.pin
  end
end