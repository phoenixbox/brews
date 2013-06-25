require 'spec_helper'

describe 'creating a new submission' do

  let!(:user){FactoryGirl.create(:user)}

  it 'fills in form with valid data' do
    submission_count =  Submission.all.count
    login(user)
    visit '/submission/new'
    fill_in('Your Answer', with: "kangaroo") 
    fill_in('Question ID', with: )
    click_button('Create Question')
    expect(submission_count + 1).to eq(Submission.all.count)
    expect(page).to have_content('success')
  end
end
