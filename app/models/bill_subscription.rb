class BillSubscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :bill

  validates :user_id,
            presence: true,
            uniqueness: { scope: :bill_id }

  validates :bill_id,
            presence: true,
            uniqueness: { scope: :user_id }
end
