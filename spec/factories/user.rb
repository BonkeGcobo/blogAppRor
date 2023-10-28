FactoryBot.define do
    factory :user do
      name { Faker::Name.name }
      post_counter { 0 } # Set the initial value of post_counter
      photo { Faker::Internet.url(host: 'example.com') }# Generate a fake image URL for photo
      bio { Faker::Lorem.paragraph }
      
      # Define any other user attributes here
    end
  end
  