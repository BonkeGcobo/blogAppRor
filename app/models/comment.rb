class Comment < ApplicationRecord
  belongs_to :post
  
  def update_number_of_comments
    self.post.increment!(:comments_counter)
  end

end
