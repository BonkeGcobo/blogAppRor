require 'rails_helper'

RSpec.describe Comment, type: :model do
    describe 'Test for validation of Comments' do
        author_user_post = FactoryBot.create(:user)
        post = FactoryBot.create(:post, author: author_user_post)
        
        subject{Comment.new(post:post, author:author_user_post, Text:"Hello World")}
        before {subject.save}
    
        it 'Post should be not be blank' do
            subject.post = nil
            expect(subject).to_not be_valid
        end

        it 'Author of commment should not be blank' do
            subject.author = nil
            expect(subject).to_not be_valid
        end

        it "Text of comment should be blank" do
            subject.Text = nil
            expect(subject).to_not be_valid
        end
    end


    describe "Test for custom methods" do
        it 'increments the comments of the associated post' do
            user = FactoryBot.create(:user)
            post = FactoryBot.create(:post, likes_counter: 0, comments_counter:0)
            comment = FactoryBot.create(:comment, post: post, author: user)
      
            
            # Expect that the likes_counter of the post has been incremented by 1
            expect(post.comments_counter).to eq(1)
        end
    end

end