require 'spec_helper'

describe "as a public visitor" do 
  context "when I click create a team" do 
    before(:each) do 
      @game = Game.create(title: "Test Game", pin: 1234, question_time: "120")
    end
    it "creates a team and joins a game" do
      visit '/'
      fill_in("team_name", :with => "Test Team")
      fill_in("game_pin", :with => 1234)
      click_button("Join Game")
      expect(page).to have_content("You joined #{@game.title}")
    end
  end
end
