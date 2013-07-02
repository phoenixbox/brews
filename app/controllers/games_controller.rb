class GamesController < ApplicationController

  def new
    @user = current_user
    @game = Game.new
  end

  def create
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
    game_presenter = GamePresenter.new(params, session[:team_id], session[:user_id])
    @user = game_presenter.user

    @game = Game.find(params[:id])

    if session[:team_id] || current_user
      if current_user == @game.user
        @team_title = "Game Admin"
      else
        @team_title = Team.find(session[:team_id]).title
      end
      chat_client = ChatClient.new(@game.id)
      @messages = chat_client.get_messages
      @submission = Submission.new

      @question = @game.questions.where(current: true).first

      if @question
        question_id = @question.id
      else
        question_id = nil
      end

      session[:game_id] = @game.id
      session[:question_id] = question_id
    else 
      redirect_to new_team_path
      flash[:alert] = "You must create a team before joining a game."
      return
    end
  end

  def activate
    game = Game.find(params[:game_id])
    game.active = true
    unauthorized! if can? :activate, @game
    if game.save
      game.reset_questions
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

  def next_question
    @game = Game.find(params[:game_id])
    @question = Question.find(session[:question_id])
    @question.mark_as_complete
    @next_question = @question.next
    if @next_question.nil?
     @game.complete
     session[:question_id] = nil
    else
     session[:question_id] = @next_question.id
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    unauthorized! if cannot?  :destroy, @game

    redirect_to games_path
  end
end
