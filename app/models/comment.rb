class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  
  after_save :update_number_of_comments
  
  private
  def update_number_of_comments
    post.increment!(:comments_counter)
  end
end
