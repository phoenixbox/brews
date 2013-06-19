require 'spec_helper'

describe "authenticated user starts and stops a new game" do

  let!(:user){FactoryGirl.create(:user)}

  it "logs in" do
    login(user)
    visit root_url
    click_link("Host Trivia Game")
    fill_in("Title", with: "Test Game")
    fill_in("Pin", with: "1234")
    fill_in("Question time", with: 10)
    click_button("Create Game")
    click_link("Start Game")
    click_link("Pause Game")
    expect(page).to have_link("Start Game")
  end

end
