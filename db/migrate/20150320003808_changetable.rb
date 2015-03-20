class Changetable < ActiveRecord::Migration
  def change
    remove_column :users, :username, :string
    add_column :users, :email, :string
  end
end
