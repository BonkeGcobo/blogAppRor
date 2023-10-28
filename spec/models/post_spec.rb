require 'rails_helper'
RSpec.describe Post, type: :model do
  # tests go here
  before :each do
    @user = User.new(name: 'Madix', post_counter: 0)
  end

  it 'Title should always be present' do
    post = Post.new(author: @user, Title: 'Some Test', comments_counter: 0, likes_counter: 0)
    expect(post).to be_valid
  end

  it 'Title should be a maximum of 250 chars' do
    post = Post.new(author: @user, Title: 'A' * 251, comments_counter: 0, likes_counter: 0)
    expect(post).to_not be_valid
  end

  it 'comments counter should not be negative' do
    Post.new(author: @user, Title: 'A' * 251, comments_counter: -1, likes_counter: 0)
    expect(subject).to_not be_valid
  end

  it 'comments counter should be integer' do
    Post.new(author: @user, Title: 'A' * 251, comments_counter: 'string', likes_counter: 0)
    expect(subject).to_not be_valid

    Post.new(author: @user, Title: 'A' * 251, comments_counter: true, likes_counter: 0)
    expect(subject).to_not be_valid

    Post.new(author: @user, Title: 'A' * 251, comments_counter: 3.21, likes_counter: 0)
    expect(subject).to_not be_valid
  end

  it 'likes counter should not be negative' do
    Post.new(author: @user, Title: 'A' * 251, comments_counter: 0, likes_counter: -1)
    expect(subject).to_not be_valid
  end

  it 'likes counter should be integer' do
    Post.new(author: @user, Title: 'A' * 251, comments_counter: 0, likes_counter: 'string')
    expect(subject).to_not be_valid

    Post.new(author: @user, Title: 'A' * 251, comments_counter: 0, likes_counter: true)
    expect(subject).to_not be_valid

    Post.new(author: @user, Title: 'A' * 251, comments_counter: 0, likes_counter: 3.21)
    expect(subject).to_not be_valid
  end

  it 'Test the update counter custom method' do
    user = FactoryBot.create(:user, post_counter: 0)
    FactoryBot.create(:post, author: user)
    FactoryBot.create(:post, author: user)
    FactoryBot.create(:post, author: user)

    expect(user.post_counter).to_not be(1)
    expect(user.post_counter).to be(3)
  end

  it 'tests the recent comments custom model method' do
    user = FactoryBot.create(:user)
    post_user = FactoryBot.create(:post, author: user)

    # Create comments associated with the post and the user
    FactoryBot.create(:comment, author: user, post: post_user)
    FactoryBot.create(:comment, author: user, post: post_user)
    FactoryBot.create(:comment, author: user, post: post_user)
    FactoryBot.create(:comment, author: user, post: post_user)
    FactoryBot.create(:comment, author: user, post: post_user)
    FactoryBot.create(:comment, author: user, post: post_user)

    # Call the custom method to get the recent comments
    recent_comments = post_user.recent_comments

    # Assertions
    expect(recent_comments.length).to eq(5) # Ensure you get five comments
  end
end
