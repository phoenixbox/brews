class MessagesController < ApplicationController
  def create
    chat_client = ChatClient.new(params[:game_id])
    @message = chat_client.create_message(game_id: params[:game_id],
                                          team_name: params[:team_name],
                                          content: params[:content])
    redirect_to :back
  end
end