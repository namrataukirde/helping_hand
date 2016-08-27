class Item < ApplicationRecord
  belongs_to :receiver, class_name: "Ngo", required: false
  belongs_to :donor, class_name: "Volunteer"

  validates :category, :quantity, presence: true

  enum category: [:furniture, :cloths, :medicines]
end
