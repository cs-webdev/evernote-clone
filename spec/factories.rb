FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    username { Faker::Internet.user_name }
    password  { Faker::Internet.password }
  end

  factory :notebook do
    description { Faker::Lorem.sentence(2) }
    user
  end
end