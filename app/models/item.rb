class Item < ApplicationRecord
  extend EnumAttribute

  belongs_to :receiver, class_name: "Ngo", required: false
  belongs_to :donor, class_name: "Volunteer"
  has_one :address, through: :donor

  enum category: [ :book, :clothes, :shoes, :accessories, :media, :furniture,
    :medicines, :other ]
  enumerize :category

  validates :category, :quantity, presence: true

  before_create :set_initial_state

  def set_initial_state
    self.state = "waiting"
  end

  def accept!
    self.update_column(:state, "accepted")
  end

  class << self
    def pending_donations
      where(state: "waiting")
    end
  end
end
