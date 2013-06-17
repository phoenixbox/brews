class HomeController < ApplicationController

  def show
    @games = Game.all
    @teams = Team.all
  end

end