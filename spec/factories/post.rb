# spec/factories/posts.rb
FactoryBot.define do
  factory :post do
    Title { Faker::Lorem.sentence }
    Text { Faker::Lorem.paragraph }
    comments_counter { Faker::Number.between(from: 0, to: 100) } # Generates a random number between 0 and 100
    likes_counter { Faker::Number.between(from: 0, to: 100) } # Generates a random number between 0 and 100
    # Generates a random datetime within the last 2 years
    created_at do
      Faker::Time.between(from: 2.years.ago, to: Time.zone.now)
    end
    updated_at { created_at } # Use the same created_at datetime for updated_at
    association :author, factory: :user # Associate the post with a user (assuming you have a user factory)

    # Define any other post attributes here
  end
end
