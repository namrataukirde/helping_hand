class Volunteer < ApplicationRecord
  extend EnumAttribute

  has_one  :user, as: :detail
  has_one  :address, as: :resource
  has_many :items, foreign_key: :donor_id

  enum occupation: [:doctor, :engineer, :student]
  enumerize :occupation

  def display_gender
    gender ? 'Male' : 'Female'
  end
end
