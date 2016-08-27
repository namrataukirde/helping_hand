class Item < ApplicationRecord
	belongs_to :receiver, class_name: "Ngo", required: false
	belongs_to :donor, class_name: "Volunteer"


  enum category: [ :book, :clothes, :shoes, :accessories, :media, :furniture,
    :medicines, :other ]

  # state_machine :state, initial: :waiting do
  #   event :accept do
  #     transition :waiting => :accept
  #   end
  # end

end
