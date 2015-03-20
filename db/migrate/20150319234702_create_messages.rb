class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :body
      t.string :author_id
      t.belongs_to :conversation
      t.timestamps null: false
    end
  end
end
