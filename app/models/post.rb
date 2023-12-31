class Post < ApplicationRecord
  validates :Title, presence: true
  validates :Title, length: { maximum: 250 }

  validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  after_save :update_counter

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_counter
    author.increment!(:post_counter)
  end
end
