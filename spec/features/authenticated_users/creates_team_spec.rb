require 'spec_helper'

describe "patron visits the hompage" do

  let(:user){FactoryGirl.create(:user)}

  it "clicks the create team button" do
    login(user)
    visit new_team_path
    fill_in("Title", with: "Teamsters")
    click_button("Create Team")
    expect(page).to have_content("Teamsters")
  end
end
