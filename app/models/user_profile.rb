class UserProfile < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? && obj.address_changed?}

  validates :address,
            presence: true

  belongs_to :user
end
