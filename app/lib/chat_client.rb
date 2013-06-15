class ChatClient
attr_reader :game_id

  def initialize(game_id)
    @game_id = game_id
    #Pass in url ? good idea
  end

  def get_messages
    # json = RestClient.get( message_url )
    # JSON.parse( json )
    RestClient.get( message_url )
  end

  def create_message(params)
    # json = something.to_json
    RestClient.post( post_message_url, params.to_json, :content_type => :json )
  end

  # RestClient.post 'http://example.com/resource', :param1 => 'one', :nested => { :param2 => 'two' }

  def post_message_url
    "#{ENV['MESSAGE_APP']}#{game_id}/messages.json" 
  end

  def message_url
    "#{ENV['MESSAGE_APP']}#{game_id}/messages.json"
  end
end