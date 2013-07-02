require 'spec_helper'

describe 'matches answers from correct answer to user answer' do

    let!(:user) { FactoryGirl.create(:user) }

  before(:each) do 
    login(user)
    click_link_or_button "Create Game"    
    fill_in "Title", with: "Test Game"
    fill_in "Pin", with: "1234"
    fill_in "game_question_time", with: 120
    click_link_or_button "Create Game"
  end


  it 'creates a submission and finds a match with correct answers' do
    expect(page).to have_content("Game successfully created!")
    fill_in "question_text", with: "Are you ready to Rumble?"
    fill_in "question_correct_answer", with: "Totes Mgoates"
    fill_in "question_points", with: "20"
    click_button('Create Question')
    expect(page).to have_content('Question was successfully created')
  end


  it 'creates a submission and does not find a match with mismatching answers' do
    fill_in "question_text", with: "Are you ready to Rumble?"
    fill_in "question_correct_answer", with: "Totes Mgoates"
    fill_in "question_points", with: "20"
    click_button('Create Question')
    visit '/'
    fill_in "team", with: "da beers"
    fill_in "game_pin", with: "1234"
    click_link_or_button "Join Game"
    fill_in('submission[content]', with: "z") 
    click_link_or_button('Submit Answer')
    expect(page).to have_content('Wrong Answer!')
  end
end
