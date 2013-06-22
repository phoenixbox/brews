describe "MessagesController#create" do
  it "sends messages to the async pubsub server" do
    message_data = {:body => "hi", :sender => "Jeff"}
    Channel.should_receive(:publish).with(message_data)
    post messages_path(message_data)
  end
end