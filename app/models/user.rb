class User < ActiveRecord::Base
  has_many :messages, foreign_key: "author_id"
  has_many :conversations, foreign_key: "sender_id"
  has_many :conversations, foreign_key: "receiver_id"

  has_secure_password

  validates :email, :password, :name, presence: true
end
