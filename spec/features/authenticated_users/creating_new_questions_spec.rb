require 'spec_helper'

describe 'creating a new question' do

  let!(:user){FactoryGirl.create(:user)}

  it 'fill in form with valid data' do
    question_count =  Question.all.count
    login(user)
    visit '/questions/new'
    fill_in('Text', with: "What is your favorite color?") 
    fill_in('Correct answer', with: "Green")
    fill_in('Order', with: 1)
    click_button('Create Question')
    expect(question_count + 1).to eq(Question.all.count)
    expect(page).to have_content('success')
  end
end
