class MessagesController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => :create

  def create
    chat_client = ChatClient.new(params[:game_id])
    message = { game_id: params[:game_id],team_name: params[:team_name],content: params[:content] }
    @message = chat_client.create_message(message)
    redirect_to :back
  end
end
