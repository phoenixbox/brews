require 'spec_helper'

describe "as a public visitor" do 
  context "when I type a response to a question" do 
    
    before(:each) do 
      Game.delete_all
      Question.delete_all
      @game = FactoryGirl.create(:game)
      @question = FactoryGirl.create(:question, :game_id => @game.id)
      visit '/'
      fill_in "team", with: "Power Rangers"
      fill_in "game_pin", with: "MyString"
      click_link_or_button "Join Game"
    end

    it "answers a question incorrectly" do
      fill_in "submission[content]", with: "Lizards"
      click_link_or_button "Submit Answer"
      expect(page).to have_content "Wrong Answer!"
    end
  end
end
