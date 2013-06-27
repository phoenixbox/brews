require 'spec_helper'

describe "as a public visitor" do 
  context "when I type a response to a question" do 
    before(:each) do 
      @game = Game.create(title: "Test Game", pin: 1234, question_time: "120")
      @question = Question.create(text: "Why is the sky blue?", order: 1, correct_answer:"ocean" )
      @team = Team.create(title: "Cupcakes")

      it "requires a team" do
        visit "/games/1"
        expect(page).to have_content "You must create a team before joining a game."
      end

      before(:each) do
        visit '/'
        fill_in "team_name", with: "Power Rangers"
        fill_in "game_pin", with: 1234
        click_link_or_button "Join Game" 

        it "has a team" do
          expect(page).to have_content "You joined #{@game.title} game"
        end

        it "answers a question incorrectly" do
          fill_in "submission[content]", with: "Lizards"
          click_link_or_button "Submit Answer"
          expect(page).to have_content "so very wrong"
        end

        it "answers a question correctly but spelled incorrectly" do
          fill_in "submission[content]", with: "ohshun"
          click_link_or_button "Submit Answer"
          expect(page).to have_content "spelled"
        end

        it "answers a question correctly and spelled correctly" do
          fill_in "submission[content]", with: "ocean"
          click_link_or_button "Submit Answer"
          expect(page).to have_content "Good job"
        end
      end
    end
  end
end
