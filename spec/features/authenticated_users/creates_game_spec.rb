require 'spec_helper'

describe "unauthenticated user starts a new game" do

  let!(:user){FactoryGirl.create(:user)}

  it "logs in" do
    login(user)
    expect(page).to have_content("Sign out")
    click_link("Create Game")
    fill_in("Title", with: "Test Game")
    fill_in("Pin", with: "1234")
    fill_in("Question time", with: 10)
    click_button("Create Game")
    expect(page).to have_content("Start Game")
  end

end
