class Comment < ApplicationRecord
  belongs_to :post

  def update_number_of_comments
    post.increment!(:comments_counter)
  end
end
