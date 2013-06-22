class TeamsController < ApplicationController
  def new
    @team = Team.new
  end

  def create
    @team = Team.new(params[:team])
    if @team.save
      session[:team_id] = @team.id
      flash[:notice]="Team created!"
      redirect_to :back
    else
      flash[:error]="Team not created!"
      redirect :back
    end
  end

  def show
    @team = Team.find(params[:id])
    session[:team_name] = @team.title
    flash[:notice]="You joined #{@team.title} team"
    @games = Game.all
  end
end
