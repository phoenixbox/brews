class TeamsController < ApplicationController
  def new
    @team = Team.new
  end

  def create
    @team = Team.new(title: params[:team])
    @game = Game.find_by_pin(params[:game_pin])

    if @team.save
      @team.update_attribute(:game_id, @game.id)
      session[:team_id] = @team.id
      session[:team_name] = params["team_name"]
      session[:game_id] = @game.id
      flash[:notice]="Team created!"
      redirect_to game_path(session[:game_id])
      flash[:notice] = "You joined #{@game.title} game"
    else
      flash[:error]="Team not created!"
      redirect_to root_path
    end
  end

  def show
    @team = Team.find(params[:id])
    session[:team_name] = @team.title
    flash[:notice]="You joined #{@team.title} team"
    @games = Game.all
  end
end
