class GamePresenter

  attr_reader :user_id, :team_id

  def initialize(params, team_id, user_id)
    @user_id = user_id
    @team_id = team_id
    @game = Game.find(params[:id])
  end

  def display_name
    if user_id.nil?
      team = Team.find(team_id)
      team.title
    elsif team_id.nil?
      user = User.find(user_id)
      user.title
    else
      "Garbage user. GO REGISTER!!!"
    end
  end

  def title_1
    "Game name"
  end

  def attr_1
    @game.title
  end



end