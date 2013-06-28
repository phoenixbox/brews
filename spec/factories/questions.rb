FactoryGirl.define do
  factory :question do
    text "MyText"
    correct_answer "ocean"
    user_id 1
    game_id 1
    order 1
    current false
    points 1
  end
end
