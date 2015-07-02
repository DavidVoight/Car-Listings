require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :manufacturer do
    sequence(:name) { |n| "#{n} BMW" }
    country 'Germany'
  end

  factory :car do
    color "Blue"
    year "2010"
    mileage 20000
    description "Very fast car."
  end
end
