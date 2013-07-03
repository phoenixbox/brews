require 'spec_helper'


describe "team can answer a question and get points added to their score" do 

  before(:each) do 
    user = User.create(email: "email@email.com")
    login(user)
    visit '/'
    click_link("Host Trivia Game!")
    fill_in("Title", with: "Test question")
    fill_in("Pin", with: "1234")
    click_button("Create Game")
    fill_in('question_text', with: "What is your favorite color?") 
    fill_in('question_correct_answer', with: "Green")
    fill_in('question_points', with: 100)
    click_button "Create Question"
    click_link_or_button "Start Game"
    visit '/'
    fill_in "team", with: "test team"
    fill_in "game_pin", with: 1234
    click_link_or_button "Join Game"
  end

  it "adds the amount of points if the submission was correct" do 
    fill_in "submission_content", with: "blah"
    click_link_or_button "Submit Answer"
    expect(page).to have_content("Wrong")
  end

  it "tallies the teams points each round based on the submission content" do 
    fill_in "submission_content", with: "Green"
    click_link_or_button "Submit Answer"
    expect(page).to have_content("You got it right")
    expect(page).to have_content("100")
  end
end
