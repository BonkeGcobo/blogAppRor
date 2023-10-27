class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :likes
  has_many :comments

  def recent_post
    posts.order(created_at: :desc).limit(3)
  end
end
