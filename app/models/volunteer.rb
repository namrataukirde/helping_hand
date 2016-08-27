class Volunteer < ApplicationRecord
  has_one  :user, as: :detail
  has_one  :address, as: :resource
  has_many :items, foreign_key: :donor_id

  enum occupation: [:doctor, :engineer, :student]
end
