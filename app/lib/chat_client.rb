class ChatClient
attr_reader :game_id

  def initialize(game_id)
    @game_id = game_id
    #Pass in url ? good idea
  end

  def get_messages
    JSON.parse(RestClient.get( message_url ))
  end

  def create_message(params)
    Channel.publish(:add_message_to_game, params.to_json)
  end

  def message_url
    "http://localhost:3000/messages?game_id=1"
    # "#{ENV['MESSAGE_APP']}#{game_id}/messages.json"
  end
end
