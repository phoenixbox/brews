require 'spec_helper'

describe 'matches answers from correct answer to user answer' do

    let!(:user) { FactoryGirl.create(:user) }

  it 'creates a submission and finds a match with correct answers' do
    login(user)
    click_link_or_button "Create Game"    
    fill_in "Title", with: "Test Game"
    fill_in "Pin", with: "1234"
    fill_in "game_question_time", with: 120
    click_link_or_button "Create Game"
    expect(page).to have_content("Game successfully created!")
    click_link_or_button "Create Question"
    fill_in "Question", with: "Are you ready to Rumble?"
    fill_in "Answer", with: "Totes Mgoates"
    click_button('Create Question')
    expect(page).to have_content('Question Created')
  end

  xit 'creates a submission and does not find a match with mismatching answers' do
    visit '/submissions/new'
    fill_in('submission[content]', with: "supercalifragilisticexpealidocious") 
    fill_in('submission[question_id]', with: question.id )
    click_button('Create Submission')
    expect(page).to have_content('wrong')
  end
end
