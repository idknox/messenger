class FixConvo2 < ActiveRecord::Migration
  def change
    remove_column :conversations, :sender, :integer
    remove_column :conversations, :receiver, :integer
    add_column :conversations, :sender_id, :integer
    add_column :conversations, :receiver_id, :integer
  end
end
