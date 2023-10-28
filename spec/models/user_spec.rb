require 'rails_helper'

RSpec.describe User, type: :model do
  # tests go here
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', post_counter: 0) }

  before { subject.save }

  it 'Name should be not blank' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'post counter should not be negative' do
    subject.post_counter = -1
    expect(subject).to_not be_valid
  end

  it 'post counter should be integer' do
    subject.post_counter = 3.21
    expect(subject).to_not be_valid

    subject.post_counter = 'Hello World'
    expect(subject).to_not be_valid

    subject.post_counter = true
    expect(subject).to_not be_valid
  end

  it 'test if the recent post custom model method works' do
    user = FactoryBot.create(:user)
    FactoryBot.create_list(:post, 6, author: user)
    recent_posts = user.recent_post
    expect(recent_posts.length).to eq(3)
  end

  it 'Check if the recent data is in decending order' do
    user = FactoryBot.create(:user)
    FactoryBot.create_list(:post, 6, author: user)
    recent_posts = user.recent_post

    expect(recent_posts[0].created_at).to be > recent_posts[1].created_at
    expect(recent_posts[1].created_at).to be > recent_posts[2].created_at
  end
end
