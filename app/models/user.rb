class User < ActiveRecord::Base
  has_many :messages, foreign_key: "author_id"
  has_many :conversations, through: :user_conversations

  has_secure_password

  validates :email, :password, :name, presence: true
end
