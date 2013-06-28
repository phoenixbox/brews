require 'spec_helper'

describe "as a public visitor" do 
  context "when I type a response to a question" do 
    
    before(:each) do 
      Game.delete_all
      Question.delete_all
      @game = FactoryGirl.create(:game)
      @question = FactoryGirl.create(:question, :game_id => @game.id)
      visit '/'
      fill_in "team_name", with: "Power Rangers"
      fill_in "game_pin", with: "MyString"
      click_link_or_button "Join Game"
    end

    it "answers a question correctly and spelled correctly" do
      fill_in "submission[content]", with: "ocean"
      click_link_or_button "Submit Answer"
      expect(page).to have_content "You got it right"
    end

    it "answers a question correctly and spelled in-correctly" do
      fill_in "submission[content]", with: "oceunw"
      click_link_or_button "Submit Answer"
      expect(page).to have_content "you need spelling lessons"
    end
  end
end
