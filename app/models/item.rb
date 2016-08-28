class Item < ApplicationRecord
  extend EnumAttribute

  belongs_to :receiver, class_name: "Ngo", required: false
  belongs_to :donor, class_name: "Volunteer"
  has_one :address, through: :donor

  enum category: [:furniture, :cloths, :medicines]
  enumerize :category
end
