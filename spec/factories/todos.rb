# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :todo do
    description { Faker::Lorem.sentence }
    user
  end
end
