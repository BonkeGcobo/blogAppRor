class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :likes

    def update_counter
        user.increment!(:post_counter)
    end

end
