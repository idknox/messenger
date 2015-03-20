class CreateUserConversations < ActiveRecord::Migration
  def change
    create_table :user_conversations do |t|
      t.belongs_to :user
      t.belongs_to :conversation
      t.timestamps null: false
    end
  end
end
