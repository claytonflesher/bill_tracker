class User < ActiveRecord::Base
  has_secure_password
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  validates :email,
            presence:   true,
            format:     /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/,
            uniqueness: true

  validates :address,
            presence: true

  validates :house_district,
            presence: true

  validates :senate_district,
            presence: true

  has_many :bills
end
