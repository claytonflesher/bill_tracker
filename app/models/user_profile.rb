class UserProfile < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? && obj.address_changed?}

  validates :address,
            presence: true

  validates :house_district,
            presence: true

  validates :senate_district,
            presence: true

  validates :state,
            presence: true

  validates :representative,
            presence: true

  validates :senator,
            presence: true

  belongs_to :user
end
