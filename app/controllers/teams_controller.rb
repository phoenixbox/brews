class TeamsController < ApplicationController
  def new
    @team = Team.new
  end

  def create
    @team = Team.new(params[:team])
    @game = Game.find_by_pin(params[:game_pin])
# store game_id & team_id params in the session when Team.new

    if @team.save
      session[:team_id] = @team.id
      session[:team_name] = params["team_name"]
      session[:game_id] = Game.find_by_pin(params[:game_pin])
      flash[:notice]="Team created!"
      redirect_to game_path(@game)
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
