require 'spec_helper'

describe "as a public visitor" do 
  context "when I visit a game page with no team id" do 
    let(:game){FactoryGirl.create(:game)}
    let(:question){FactoryGirl.create(:question)}

    it "requires a team" do
      visit "/games/#{game.id}"
      expect(page).to have_content "You must create a team before joining a game."
    end
  end
end
