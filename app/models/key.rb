class Key < ActiveRecord::Base
  validates :api,
            presence: true

  validates :key,
            presence: true
end
