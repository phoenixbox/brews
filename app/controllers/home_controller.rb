class HomeController < ApplicationController

  def show
    @team = Team.new
  end

end
