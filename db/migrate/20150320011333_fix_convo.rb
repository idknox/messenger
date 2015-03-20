class FixConvo < ActiveRecord::Migration
  def change
    add_column :conversations, :sender, :integer
    add_column :conversations, :receiver, :integer
    remove_column :messages, :author_id, :string
  end
end
