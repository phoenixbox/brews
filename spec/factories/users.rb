# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "test@example.com"
    password "login"
    password_confirmation "login"
  end
end
