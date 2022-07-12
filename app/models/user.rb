# sample -> email: "ilia@gmail.com", username: "uncleilia", password: "hbk2017qqw", password_confirmation: "hbk2017qqw"
class User < ApplicationRecord
  has_secure_password
  validates :username, length: { minimum: 6, maximum: 25 }
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'must be a valid email address' }

  has_many :post
end
