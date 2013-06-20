require 'spec_helper'

describe "as a public user visiting the site" do 
  context "when I visit the home page I can make an account" do 
    before(:each) do 
      visit '/'
      click_link("Signup to create a Game!")
    end
    it "says Signup to create a game" do 
      expect(page).to have_content("Create a Brews-N-Q's Account")
      fill_in("Email", :with => "email@email.com")
      fill_in("Password", :with => "password")
      fill_in("Password confirmation", :with => "password")
      click_button "Sign Up"
      expect(page).to have_content("User saved!")
    end

    it "validates the email" do 
      fill_in("Email", :with => "notanemail")
      fill_in("Password", :with => "password")
      fill_in("Password confirmation", :with => "password")
      click_button "Sign Up"
      expect(page).to have_content("User not saved!")
    end

    it "validates the password length" do 
      fill_in("Email", :with => "anemail@email.com")
      fill_in("Password", :with => "12345")
      fill_in("Password confirmation", :with => "12345")
      click_button "Sign Up"
      expect(page).to have_content("User not saved!")
    end

    it "validates the password length" do 
      fill_in("Email", :with => "anemail@email.com")
      fill_in("Password", :with => "1234567")
      fill_in("Password confirmation", :with => "1234576")
      click_button "Sign Up"
      expect(page).to have_content("User not saved!")
    end
  end
end