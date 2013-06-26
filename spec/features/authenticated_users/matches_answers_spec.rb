require 'spec_helper'

describe 'matches answers from correct answer to user answer' do

  before(:each) do 
    login(user)
    click_link_or_button "Create Game"    
    fill_in "Title", with: "Test Game"
    fill_in "Pin", with: "1234"
    fill_in "game_question_time", with: 120
    click_link_or_button "Create Game"
  end

  it 'creates a submission and finds a match with correct answers' do
    visit '/'
    fill_in "team_name", with: "test team"
    fill_in "game_pin", with: "1234"
    click_link_or_button "Join Game"
    
    click_button('Create Submission')
    expect(page).to have_content('right')
  end

  it 'creates a submission and does not find a match with mismatching answers' do
    visit '/submissions/new'
    fill_in('submission[content]', with: "supercalifragilisticexpealidocious") 
    fill_in('submission[question_id]', with: question.id )
    click_button('Create Submission')
    expect(page).to have_content('wrong')
  end
end
