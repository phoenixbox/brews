require 'spec_helper'

feature 'admin creates a game' do
  
  let(:user){FactoryGirl.create(:user)}

  scenario 'tries to join that game' do
    login(user)
    visit new_game_path
    fill_in 'title', with: 'tester'
    fill_in 'pin', with: '1234'
    fill_in 'question_time', with: 20
    click_button 'submit'
    visit root_path
    fill_in 'team_name', with: 'tester'
    fill_in 'game_pin', with: '1234'
    click_button 'Join Game'
    expect(page).to have_content("tester")
  end
end