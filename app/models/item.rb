class Item < ApplicationRecord
	belongs_to :receiver, class_name: "Ngo", required: false
	belongs_to :donor, class_name: "Volunteer"


  enum category: [ :book, :clothes, :shoes, :accessories, :media, :furniture,
    :medicines, :other ]

  before_create :set_initial_state

  def set_initial_state
    self.state = "waiting"
  end

  def accept!
    self.update_column(:state, "accepted")
  end

  class << self
    def categories_collection
      categories.each_with_object([]) do |(name, _), acc|
        acc << [name.capitalize, name]
      end
    end

    def pending_donations
      where(state: "waiting")
    end
  end
end
