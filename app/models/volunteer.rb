class Volunteer < ApplicationRecord
  has_one  :user, as: :detail
  has_one  :address, as: :resource
  has_many :items, foreign_key: :donor_id

  enum occupation: [:doctor, :engineer, :student]

  class << self
    def occupations_collection
      occupations.each_with_object([]) do |(name, _), acc|
        acc << [name.capitalize, name]
      end
    end
  end
end
