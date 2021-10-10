class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  # validates :password, length: { minimum: 6 }, allow_nil: true
  # validates :password_confirmation, presence: true, on: :create
end
