# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    title "MyString"
    pin "MyString"
    admin_pin "MyString"
    question_time 1
  end
end
