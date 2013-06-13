class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(params[:game])
    if @game.save
      flash[:success]= "Game successfully created!"
      redirect_to @game
    else
      flash[:error] = "Game not created"
      render :new
    end
  end

  def index
  end

  def show
    @game = Game.find(params[:id])
  end
end
