require 'spec_helper'

describe "unauthenticated user visits homepage" do
  
  it "logs in" do
    visit root_url
    click_link("Sign-up")
    expect(page).to have_content("")
  end

end