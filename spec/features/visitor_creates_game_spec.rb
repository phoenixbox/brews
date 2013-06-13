require 'spec_helper'

describe "visitor to homepage" do

  it "creates a game" do
    visit root_url
    expect(page).to have_link("Create a game")
    click_link("Create a game")
    expect(page).to have_content("Game title")
  end
end