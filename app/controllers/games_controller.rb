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
    chat_client = ChatClient.new(@game.id)
    @messages = chat_client.get_messages
    # @message = chat_client.post_message
  end
end
