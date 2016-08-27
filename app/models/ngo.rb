class Ngo < ApplicationRecord
  has_one  :user, as: :detail
  has_one  :address, as: :resource
  has_many :items, foreign_key: :receiver_id

  validates :category, :name, presence: true

  enum category: [:charitable, :service, :participatory, :empowering, :others]
end
