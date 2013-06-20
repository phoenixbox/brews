class Channel
  def self.host
    @host ||= Redis.new
  end

  def self.publish(channel_name, message)
    host.publish(channel_name, message)
  end
end

#Faye subscribe to redis channel / do http request to publish to brews