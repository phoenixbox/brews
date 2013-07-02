require 'spec_helper'


describe "team can answer a question and get points added to their score" do 

  before(:each) do 
    # Create user and login
    user = User.create(email: "email@email.com")
    login(user)
    visit '/'
    click_link("Host Trivia Game!")
    # Create the game
    fill_in("Title", with: "Test Game")
    fill_in("Pin", with: "1234")
    fill_in("Question time", with: 10)
    click_button("Create Game")
    # Create questions
    fill_in('question_text', with: "What is your favorite color?") 
    fill_in('question_correct_answer', with: "Green")
    fill_in('question_points', with: 100)
    click_button "Create Question"
    # Join the game
    visit '/'
    fill_in "team", with: "test team"
    fill_in "game_pin", with: 1234
    click_link_or_button "Join Game"
  end

  it "adds the amount of points if the submission was correct" do
    fill_in "submission_content", with: "Green"
    click_link_or_button "Submit Answer"
    expect(page).to have_content("You got it right")
    expect(page).to have_content("100")
  end

  it "does not add the points if the question is wrong" do
    fill_in "submission_content", with: "Red"
    click_link_or_button "Submit Answer"
    expect(page).to_not have_content("100")
    expect(page).to have_content("Wrong Answer!")
  end

  it "removes the submission box once answer is submitted for that question" do
    fill_in "submission_content", with: "Red"
    click_link_or_button "Submit Answer"
    expect(page).to_not have_content("Submit Answer")
    expect(page).to_not have_css("input#submission_content")
  end

end