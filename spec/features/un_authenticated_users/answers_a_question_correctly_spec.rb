require 'spec_helper'

describe "as a public visitor" do 
  context "when I type a response to a question" do 
    before(:each) do
      @user = FactoryGirl.create(:user)
      @game = FactoryGirl.create(:game)
      @question = FactoryGirl.create(:question, game_id: @game.id)
      @question.current = true
      @game.active = true
    end

    it "answers a question correctly and spelled correctly" do
      visit '/'
      fill_in "team", with: "Power Rangers"
      fill_in "game_pin", with: "MyString"
      click_link_or_button "Join Game"
      expect(page).to have_content @game.title
      expect(page).to have_content @question.text

      fill_in "submission[content]", with: "ocean"
      click_link_or_button "Submit Answer"
      expect(page).to have_content "You got it right"
    end

    it "answers a question correctly and spelled in-correctly" do
      visit '/'
      fill_in "team", with: "Power Rangers"
      fill_in "game_pin", with: "MyString"
      click_link_or_button "Join Game"
      fill_in "submission[content]", with: "oceunw"
      click_link_or_button "Submit Answer"
      expect(page).to have_content "you need spelling lessons"
    end
  end
end
