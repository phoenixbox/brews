class ChatClient
attr_reader :game_id

  def initialize(game_id)
    @game_id = game_id
    #Pass in url ? good idea
  end

  def get_messages
    # json = RestClient.get( message_url )
    # JSON.parse( json )
    JSON.parse(RestClient.get( message_url ))
  end

  def create_message(params)
    # Add to redis queue instead of making the post yourself
    
    RestClient.post(post_message_url, params.to_json, :content_type => :json, :accept => :json)
  end

  def post_message_url
    "http://localhost:3000/messages.json"
    # "#{ENV['MESSAGE_APP']}#{game_id}/messages.json" 
  end

  def message_url
    "http://localhost:3000/messages?game_id=#{game_id}" 
  end
end