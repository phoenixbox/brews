class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    user = current_user
    @game = user.games.new(params[:game])
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

  def activate
    game = Game.find(params[:game_id])
    game.active = true
    if game.save
      redirect_to game
      flash[:success] = "The game has been activated."
    else
      redirect_to game, :message => "Sorry, the game was not activated."
    end
  end

  def deactivate
    game = Game.find(params[:game_id])
    game.active = false
    if game.save
      redirect_to game
      flash[:success] = "The game has been deactivated."
    else
      redirect_to game, :message => "Sorry, the game remains active."
    end
  end
end
