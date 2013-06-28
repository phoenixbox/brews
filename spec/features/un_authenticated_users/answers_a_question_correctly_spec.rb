require 'spec_helper'

describe "as a public visitor" do 
  context "when I type a response to a question" do 
    
  let(:user){FactoryGirl.create(:user)}
  before(:each) do 
    login(user)
    visit root_url
    click_link("Host Trivia Game!")
    fill_in("Title", with: "Test Game")
    fill_in("Pin", with: "1234")
    fill_in("Question time", with: 10)
    click_button("Create Game")
    fill_in('question_text', with: "What is your favorite color?") 
    fill_in('correct_answer', with: "ocean")
    click_button('Create Question')
   end

    it "answers a question correctly and spelled correctly" do
      visit '/'
      fill_in "team_name", with: "Power Rangers"
      fill_in "game_pin", with: "1234"
      click_link_or_button "Join Game"
      save_and_open_page
      fill_in "submission[content]", with: "ocean"
      click_link_or_button "Submit Answer"
      expect(page).to have_content "Good job"
    end
  end
end
