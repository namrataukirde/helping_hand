class Ngo < ApplicationRecord
  extend EnumAttribute

  has_one  :user, as: :detail
  has_one  :address, as: :resource
  has_many :items, foreign_key: :receiver_id

  enum category: [:charitable, :service, :participatory, :empowering]
  enumerize :category
end
