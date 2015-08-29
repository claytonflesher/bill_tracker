class Bill < ActiveRecord::Base
  belongs_to :user

  validates :name,
            presence: true,
            format: /\A[A-Z]+[0-9]+\z/
end
