require 'spec_helper'

describe 'matches answers from correct answer to user answer' do
  
  let!(:user){FactoryGirl.create(:user)}
  let!(:question){FactoryGirl.create(:question)}

  it 'creates a submission and finds a match with correct answers' do
    login(user)
    visit '/submissions/new'
    fill_in('submission[content]', with: "Green") 
    fill_in('submission[question_id]', with: question.id)
    click_button('Create Submission')
    expect(page).to have_content('right')
  end

  it 'creates a submission and does not find a match with mismatching answers' do
    login(user)
    visit '/submissions/new'
    fill_in('submission[content]', with: "supercalifragilisticexpealidocious") 
    fill_in('submission[question_id]', with: question.id )
    click_button('Create Submission')
    expect(page).to have_content('wrong')
  end
end
