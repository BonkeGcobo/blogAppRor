class UpdateExistingPostsCounters < ActiveRecord::Migration[7.1]
  def up
    change_column_default :posts, :comments_counter, 0
    change_column_default :posts, :likes_counter, 0

    execute <<-SQL
      UPDATE posts
      SET comments_counter = 0
      WHERE comments_counter IS NULL;

      UPDATE posts
      SET likes_counter = 0
      WHERE likes_counter IS NULL;
    SQL
  end
end
