FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' } # Set the desired password here
    # confirmed_at { Time.zone.now } # Mark the user as confirmed
    name { Faker::Name.name }
  end
end
