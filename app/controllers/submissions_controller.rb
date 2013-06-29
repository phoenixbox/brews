class SubmissionsController < ApplicationController

  def new
    @submission = Submission.new
  end

  def create
    @game = Game.find(session[:game_id])
    team = Team.find(session[:team_id])
    @submission = Submission.save_and_score(params[:submission], team.id)

    if @submission.save
      team.update_score
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
