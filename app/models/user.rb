class User < ApplicationRecord
  VALIDATE_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :name, presence: true, length: { minimum: 5, maximum: 50 }
  validates :email, presence: true, length: { minimum: 5, maximum: 50 }, format: { with: VALIDATE_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 5, maximum: 20 }
end
