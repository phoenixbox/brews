require 'spec_helper'

describe "patron visits the hompage" do
  it "clicks the create team button" do
    visit root_url
    within(:css, "div.hero-unit"){
      click_link("Signup to create a Game!")
      expect(current_path).to eq new_user_path
    }
    expect(page).to have_css('input#user_email.text_field')
    expect(page).to have_css('input#user_password.number_field')
    expect(page).to have_css('input#user_password_confirmation.number_field')
  end

  it "fills in the form and creates a team" do
    visit new_team_path
    fill_in("team_title", with: "Teamsters")
    click_button("Create Team")
    expect(page).to have_content("Teamsters")
  end
end
