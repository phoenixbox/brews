require 'spec_helper'

describe "patron visits the hompage" do
  it "clicks the create team button" do
    visit root_url
    within(:css, "div.hero-unit"){
      click_link("Create a New Team!")
      expect(current_path).to eq new_team_path
    }
    expect(page).to have_css('input#team_title.text_field')
  end

  it "fills in the form and creates a team" do
    visit new_team_path
    fill_in("Title", with: "Teamsters")
    click_button("Create Team")
    expect(page).to have_content("Teamsters")
  end
end
