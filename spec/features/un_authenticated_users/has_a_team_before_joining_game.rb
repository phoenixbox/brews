require 'spec_helper'

describe "as a public visitor" do 
  context "when I type a response to a question" do 
   # let(:game){FactoryGirl.create(:game)}
   # let(:question){FactoryGirl.create(:question)}

    it "has a team" do
      visit '/'
      fill_in "team_name", with: "Power Rangers"
      fill_in "game_pin", with: "MyString"
      click_link_or_button "Join Game"
      expect(page).to have_content "You joined #{game.title} game"
    end
  end
end
