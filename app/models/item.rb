class Item < ApplicationRecord
  belongs_to :receiver, class_name: "Ngo"
  belongs_to :donor, class_name: "Volunteer"

  enum category: [:furniture, :cloths, :medicines]
end
