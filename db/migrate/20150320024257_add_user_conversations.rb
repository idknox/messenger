class AddUserConversations < ActiveRecord::Migration
  def change
    remove_column :conversations, :sender_id, :integer
    remove_column :conversations, :receiver_id, :integer
  end
end
