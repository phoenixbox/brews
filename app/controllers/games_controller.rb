class GamesController < ApplicationController

  def new
    @user = current_user
    @game = Game.new
  end

  def create
    # binding.pry
    user = current_user
    @game = user.games.new(params[:game])
    if @game.save
      session[:game_id] = @game.id
      flash[:success]= "Game successfully created!"
      redirect_to new_game_question_path(@game)
    else
      flash[:error] = "Game not created"
      render :new
    end
  end

  def edit
    @game = Game.find_by_id(params[:id])
    unauthorized! if cannot?  :edit, @game
  end

  def update
    @game = Game.find(params[:id])
    @game.update_attributes(params[:game])
    redirect_to @game
  end

  def index
    @games = Game.all
  end

  def show

    # Give me the first question that does not have a submission

    if session[:team_id] || current_user
      if current_user
        @team_title = "Game Admin"
      else
        @team_title = Team.find(session[:team_id]).title
      end
      @game = Game.find(params[:id])
      chat_client = ChatClient.new(@game.id)
      @messages = chat_client.get_messages
      @messages = []
      @submission = Submission.new
      session[:game_id] = @game.id
      
      
      @question = Question.find_by_game_id(@game.id)
      session[:question_id] = @question.id
    else
      redirect_to new_team_path
      flash[:alert] = "You must create a team before joining a game."
      return
    end
  end

  def activate
    game = Game.find(params[:game_id])
    game.active = true
    unauthorized! if can?  :activate, @game
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

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    unauthorized! if cannot?  :destroy, @game

    redirect_to games_path
  end
end
