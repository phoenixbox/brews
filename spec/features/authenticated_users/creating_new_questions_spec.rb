require 'spec_helper'

describe 'creating a new question' do

  let!(:user){FactoryGirl.create(:user)}

  it 'fill in form with valid data' do
    question_count =  Question.all.count
    login(user)
    visit '/'
    click_link("Host Trivia Game!")
    fill_in("Title", with: "Test question")
    fill_in("Pin", with: "1234")
    fill_in("Question time", with: 10)
    click_button("Create Game")
    fill_in('question_text', with: "What is your favorite color?") 
    fill_in('question_correct_answer', with: "Green")
    fill_in('question_points', with: 100)
    click_button "Create Question"
    expect(question_count + 1).to eq(Question.all.count)
    expect(page).to have_content("Test question")
  end
end
