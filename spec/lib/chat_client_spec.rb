require 'spec_helper'

describe "ChatClient" do

  let(:game){FactoryGirl.create(:game)}
  let(:chat_client){ChatClient.new(1)}

  it "creates a new message" do
    initial_count = chat_client.get_messages.count
    message = {content: "test message", game_id: 1, team_name: "team awesome"}
    chat_client.create_message(message)
    sleep 2
    updated_count = chat_client.get_messages.count
    expect(updated_count).to eq(initial_count + 1)
  end
end
