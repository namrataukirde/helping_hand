class Volunteer < ApplicationRecord
  has_one  :user, as: :detail
  has_one  :address, as: :resource
  has_many :items, foreign_key: :donor_id

  validates :name, :age, :gender, :occupation, presence: true

  enum occupation: [:doctor, :engineer, :student]
end
