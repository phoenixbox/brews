require 'spec_helper'

describe "visitor to homepage" do

  it "creates a game" do
    visit root_url
    click_link("Create a game")
    fill_in("Title", :with => "test")
    fill_in("Pin", :with => "test")
    fill_in("Admin pin", :with => "test")
    fill_in("Question time", :with => 10)
    click_button("Create Game")
    expect(page).to have_content("success")
  end
end