# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :anime_show do
    name Faker::Name.name
    description Faker::Lorem.sentence(10)
    url Faker::Internet.url
    image_url Faker::Internet.url
  end
end
