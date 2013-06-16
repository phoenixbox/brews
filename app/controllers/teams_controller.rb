class TeamsController < ApplicationController
  def new
    @team = Team.new
  end

  def create
    @team = Team.new(params[:team])
    if @team.save
      flash[:notice]="Team created!"
      redirect_to team_path(@team.id)
    else
      flash[:error]="Team not created!"
      redirect :back
    end
  end

  def show
    @team = Team.find(params[:id])
  end
end