class Bill < ActiveRecord::Base
  has_many :users, through: :bill_subscriptions
  has_many :bill_subscriptions

  serialize :description

  validates :name,
            presence: true,
            format: /\A[A-Z]+[0-9]+\z/

  validates :description,
            presence: true

end
