class QuestionsController < ApplicationController
  def index
    @questions = Question.all

    respond_to do |format|
      format.html
      format.json { render json: @questions }
    end
  end

  def show
    @question = Question.find(params[:id])
    @question_text = @question.text

    respond_to do |format|
      format.html
      format.json { render json: @question }
    end
  end

  def new
    @question = Question.new
    @game = Game.find(session[:game_id])
    respond_to do |format|
      format.html
      format.json { render json: @question }
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @game = Game.find(session[:game_id])
    @question = Question.new(params[:question])

    respond_to do |format|
      if @question.save
        format.html { redirect_to @game, notice: 'Question was successfully created.' }
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end
end
