describe "MessagesController#create" do

  let(:message_data){{team_name: "hi", content: "Howdy", game_id: 1}}

  before(:all) do
    @chat = ChatClient.new(1)
    @chat.stub(:create_message).with(message_data)
  end

  it "sends messages to the async pubsub server" do
    # Channel.should_receive(:publish).with(message_data)
    # post messages_path(message_data)
    expect {
      post :create, message_data
    }.to 
    # post messages_path(message_data)
  end
end