class RemoveUserIdFromLikes < ActiveRecord::Migration[7.1]
  def change
    remove_column :likes, :user_id, :bigint
  end
end
