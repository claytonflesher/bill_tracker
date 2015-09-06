class BillSubscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :bill

  validates :user_id,
            presence: true

  validates :bill_id,
            presence: true
end
