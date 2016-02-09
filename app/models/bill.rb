class Bill < ActiveRecord::Base
  has_many :users, through: :bill_subscriptions
  has_many :bill_subscriptions

  serialize :description

  validates :name,
            presence: true,
            format: /\A[A-Z]+[0-9]+\z/

  validates :description,
            presence: true

  def last_action
    if description[-4] =~ /\A.{2,}\z/
      description[-4]
    else
      description[-3]
    end
  end
end
