class ChatClient
attr_reader :game_id

  def initialize(game_id)
    @game_id = game_id
  end

  def get_messages
    json = RestClient.get( message_url )
    JSON.parse( json )
  end

  def post_message
    json = something.to_json
    RestClient.post( post_message_url, :game_id => 1 )
  end

  # RestClient.post 'http://example.com/resource', :param1 => 'one', :nested => { :param2 => 'two' }

  def post_message_url
    "#{ENV['MESSAGE_APP']}#{game_id}/messages.json" 
  end

  def message_url
    "#{ENV['MESSAGE_APP']}#{game_id}/messages.json"
  end
end