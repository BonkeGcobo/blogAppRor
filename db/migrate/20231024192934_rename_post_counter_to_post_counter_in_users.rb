class RenamePostCounterToPostCounterInUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :postCounter, :post_counter
  end
end
