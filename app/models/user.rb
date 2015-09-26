class User < ActiveRecord::Base
  has_secure_password

  validates :email,
            presence:   true,
            format:     /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/,
            uniqueness: true

  has_one  :user_profile
  has_many :bills, through: :bill_subscriptions
  has_many :bill_subscriptions
end
