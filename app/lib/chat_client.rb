class ChatClient
attr_reader :game_id

  def initialize(game_id)
    @game_id = game_id
  end

  def get_messages
    json = RestClient.get( message_url )
    JSON.parse( json )
  end

  def message_url
    "#{ENV['MESSAGE_APP']}#{game_id}/messages.json"
  end
end