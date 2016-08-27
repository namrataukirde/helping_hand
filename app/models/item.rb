class Item < ApplicationRecord
	belongs_to :receiver, class_name: "Ngo", required: false
	belongs_to :donor, class_name: "Volunteer"


  enum category: [ :book, :clothes, :shoes, :accessories, :media, :furniture,
    :medicines, :other ]

  state_machine :state, initial: :waiting do
    event :accept do
      transition :waiting => :accept
    end
  end

  enum category: [:furniture, :cloths, :medicines]

  class << self
    def categories_collection
      categories.each_with_object([]) do |(name, _), acc|
        acc << [name.capitalize, name]
      end
    end
  end
end
