# spec/factories/likes.rb
FactoryBot.define do
  factory :like do
    association :post
    association :author, factory: :user # Assuming you have a User factory

    # Additional attributes and settings for created_at and updated_at can be added here
  end
end
