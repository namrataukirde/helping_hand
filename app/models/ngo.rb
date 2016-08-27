class Ngo < ApplicationRecord
  has_one  :user, as: :detail
  has_one  :address, as: :resource
  has_many :items, foreign_key: :receiver_id

  enum category: [:charitable, :service, :participatory, :empowering]

  class << self
    def categories_collection
      categories.each_with_object([]) do |(name, _), acc|
        acc << [name.capitalize, name]
      end
    end
  end
end
