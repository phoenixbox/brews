# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "test@example.com"
    salt "asdasdastr4325234324sdfds"
    crypted_password Sorcery::CryptoProviders::BCrypt.encrypt("secret", "asdasdastr4325234324sdfds")
  end
end
