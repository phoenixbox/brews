class SubmissionsController < ApplicationController

  def new
    @submission = Submission.new
  end

  def create
    @game = Game.find(session[:game_id])
    @team = Team.find_by_id(session[:team_id])
    @question = Question.find_by_id(session[:question_id])
    @submission = Submission.new(params[:submission])

    fuzzy = FuzzyMatchComparison.new(@question.correct_answer, @submission.content)
    

    if @submission.save

      redirect_to game_path(@game), notice: 'Submission was successfully created.'
    else
      render action: "new"
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
