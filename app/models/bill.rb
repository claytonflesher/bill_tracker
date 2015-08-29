class Bill < ActiveRecord::Base
  belongs_to :user

  serialize :description

  validates :name,
            presence: true,
            format: /\A[A-Z]+[0-9]+\z/

  validates :user_id,
            presence: true

  validates :description,
            presence: true

  validates_uniqueness_of :name, :scope => :user_id
end
