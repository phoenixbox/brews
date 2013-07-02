require 'spec_helper'

describe "authenticated user starts and stops a new game" do

  let(:user){FactoryGirl.create(:user)}

  VCR.use_cassette('creates_a_new_message') do
    it "logs in and creates a game" do
      login(user)
      visit root_url

      click_link("Host Trivia Game!")
      fill_in("Title", with: "Test Game")
      fill_in("Pin", with: "1234")
      fill_in("Question time", with: 10)
      click_button("Create Game")
      expect(page).to have_content("Game successfully created")

      fill_in "question_text", with: "What is the answer to the universe"
      fill_in "question_correct_answer", with: "42"
      fill_in "question_points", with: 100
      click_button "Create Question"

      expect(page).to have_content("Start Game")
      click_link("Start Game")
      expect(page).to have_content("Add Question")
    end
  end

  it "does not let you create game while not logged in" do
    visit "/games/new"
    page.should have_content("NoMethodError")
  end

end
