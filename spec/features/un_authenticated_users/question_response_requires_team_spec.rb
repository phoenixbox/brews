require 'spec_helper'

describe "as a public visitor" do 
  context "when I type a response to a question" do 
    let(:game){FactoryGirl.create(:game)}
    let(:question){FactoryGirl.create(:question)}

    it "requires a team" do
      visit "/games/#{game.id}"
      expect(page).to have_content "You must create a team before joining a game."
    end
  end
end
