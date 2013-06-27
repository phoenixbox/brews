class MessagesController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => :create

  def create
    chat_client = ChatClient.new(params[:game_id])
    message = { game_id: params[:game_id], team_name: params[:team_name], content: params[:content] }
    chat_client.create_message(message)

    client = Faye::Client.new('http://localhost:9292/faye')
    client.publish("/messages/#{params[:game_id]}", 'text' => message)
    render json: message, status: 201
  end
end
