class AddAuthorToLikes < ActiveRecord::Migration[7.1]
  def change
    add_reference :likes, :author, null: false, foreign_key: { to_table: :users }
  end
end
