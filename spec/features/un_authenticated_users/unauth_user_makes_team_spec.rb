require 'spec_helper'


describe "as a public visitor" do 
  context "when I click create a team" do 
    before(:each) do 
      visit '/'
    end
    it "creates a team" do 
      click_link("Create a Team")
      fill_in("team_title", :with => "Test Team")
      click_button("Create Team")
      expect(page).to have_content("You joined")
    end


  end




end