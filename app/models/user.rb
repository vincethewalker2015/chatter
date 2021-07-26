class User < ApplicationRecord
  validates :username, presence: true,
            uniqueness: { case_sensitive: false } 
            # length: { minimum: 3, maximum: 20}
  has_many :messages, dependent: :destroy
  has_secure_password
end
