class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :Title
      t.string :Text
      t.integer :comments_counter
      t.integer :likes_counter

      t.timestamps
    end
  end
end
