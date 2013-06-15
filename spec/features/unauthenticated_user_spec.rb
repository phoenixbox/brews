require 'spec_helper'

describe "unauthenticated user visits homepage" do

  let!(:user){FactoryGirl.create(:user)}

  it "logs in" do
    login(user)
    expect(page).to have_content("Sign out")
  end

end
