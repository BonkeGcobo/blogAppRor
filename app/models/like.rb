class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :author,  presence: true
  validates :post,   presence: true 

  after_save :update_likes

  private

  def update_likes
    post.increment!(:likes_counter)
  end
end
