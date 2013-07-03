require 'spec_helper'

describe 'admin skips to next question' do 
  it 'creates a game and questions' do
    visit '/'
    click_link_or_button 'Want to Host a Game?'
    fill_in('user[email]' with: 'bartime@example.com')
    fill_in('user[password]' with: 'password')
    fill_in('user[password_confirmation]' with: 'password')
    click_link_or_button 'Create Game'
    fill_in('game[title]' with: 'Big Bar Game')
    fill_in('game[pin]' with: '12398') 
    fill_in ('game[question_time' with: 120)
    click_link_or_button 'Create Game'
    fill_in('question[text]' with: 'This shiz is....')
    fill_in('question[correct_answer' with: 'bananas')
    fill_in('question[points' with: 200)
    click_link_or_button 'Create Question'
    click_link_or_button 'Add Question'
    fill_in('question[text]' with: 'Yo mama is so fat')
    fill_in('question[correct_answer' with: 'rainbow skittles')
    fill_in('question[points' with: 200)
    click_link_or_button 'Create Question'
    click_link_or_button 'Start Game'
    click_link_or_button 'Next Question'
    expect(page).should_not have_content 'This shiz'
  end
end
