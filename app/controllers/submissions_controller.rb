class SubmissionsController < ApplicationController

  def index
    @submissions = Submission.all

    respond_to do |format|
      format.html
      format.json { render json: @submissions }
    end
  end

  def show
    @submission = Submission.find(params[:id])
    @question = Question.find_by_id(session[:question_id])
    @user_answer = []
    @user_answer << @question.correct_answer
    @fuzzy = FuzzyMatch.new(@user_answer).find(@submission.content)
    @bad_speller = @submission.content.upcase != @question.correct_answer.upcase
    @game = Game.find(session[:game_id])

    respond_to do |format|
      format.html
      format.json { render json: @submission }
    end
  end

  def new
    @submission = Submission.new

    respond_to do |format|
      format.html
      format.json { render json: @submission }
    end
  end

  def edit
    @submission = Submission.find(params[:id])
  end

  def create
    @submission = Submission.new(params[:submission])

    respond_to do |format|
      if @submission.save
        format.html { redirect_to @submission, notice: 'Submission was successfully created.' }
        format.json { render json: @submission, status: :created, location: @submission }
      else
        format.html { render action: "new" }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @submission = Submission.find(params[:id])

    respond_to do |format|
      if @submission.update_attributes(params[:submission])
        format.html { redirect_to @submission, notice: 'Submission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy

    respond_to do |format|
      format.html { redirect_to submissions_url }
      format.json { head :no_content }
    end
  end
end
