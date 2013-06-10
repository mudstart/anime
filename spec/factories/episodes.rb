# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :episode do
    name Faker::Name.name
    sequence(:number) { |n| n}
    url Faker::Internet.url
    image_url Faker::Internet.url
  end
end
