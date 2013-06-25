class ChatClient
  attr_reader :game_id

  def initialize(game_id)
    @game_id = game_id
  end

  def get_messages
    JSON.parse(RestClient.get( message_url ))
  end

  def create_message(params)
    Channel.publish(:add_message_to_game, params.to_json)
  end

  def message_url
    "#{ENV['MESSAGE_APP']}/messages?game_id=#{game_id}"
  end
end
