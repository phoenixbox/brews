class GamePresenter

  attr_reader :user_id, :team_id, :game_id

  def initialize(params, team_id, user_id)
    @user_id = user_id
    @team_id = team_id
    @game_id = params[:id]
  end

  def user
    if user_id
      @user ||= AdminGameUser.new(user_id, game_id)
    elsif team_id
      @user ||= TeamGameUser.new(team_id)
    else
      "Garbage user. GO REGISTER!!!"
    end
  end
end