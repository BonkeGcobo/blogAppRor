# spec/models/like_spec.rb

require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Test for validation of likes' do
    author_user_post = FactoryBot.create(:user)
    post = FactoryBot.create(:post, author: author_user_post)
    
    subject{Like.new(post:post, author:author_user_post)}
    before {subject.save}

    it 'Post should be not be blank' do
        subject.post = nil
        expect(subject).to_not be_valid
    end

    it 'Author of like should not be blank' do
        subject.author = nil
        expect(subject).to_not be_valid
    end

  end


  describe 'private method update_likes' do
    it 'increments the likes_counter of the associated post' do
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:post, likes_counter: 0)
      like = FactoryBot.create(:like, post: post, author: user)

      
      # Expect that the likes_counter of the post has been incremented by 1
      expect(post.likes_counter).to eq(1)
    end
  end
end
