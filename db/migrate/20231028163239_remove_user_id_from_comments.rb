class RemoveUserIdFromComments < ActiveRecord::Migration[7.1]
  def change
    remove_column :comments, :user_id, :bigint
  end
end
