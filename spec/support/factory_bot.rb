require 'factory_bot'
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

FactoryBot.define do
  factory :user do
    sequence(:username) {|n| "user#{n}" }
    sequence(:first_name) {|n| "fname#{n}" }
    sequence(:last_name) {|n| "lname#{n}" }
    sequence(:email) {|n| "person#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  FactoryBot.define do
    factory :league do
      sequence(:league_name) { |n| "league#{n}"}
    end
  end



end
