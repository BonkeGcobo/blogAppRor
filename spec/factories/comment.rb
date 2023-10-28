# spec/factories/comments.rb
FactoryBot.define do
  factory :comment do
    Text { Faker::Lorem.sentence } # Generates a random sentence as a placeholder for text
    association :author, factory: :user
    association :post, factory: :post
    # Generates a random datetime within the last 2 years
    created_at do
      Faker::Time.between(from: 2.years.ago, to: Time.zone.now)
    end
    updated_at { created_at } # Use the same created_at datetime for updated_at
  end
end
