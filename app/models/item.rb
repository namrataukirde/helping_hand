class Item < ApplicationRecord
  extend EnumAttribute

  belongs_to :receiver, class_name: "Ngo", required: false
  belongs_to :donor, class_name: "Volunteer"
  has_one :address, through: :donor

  enum category: [ :book, :clothes, :shoes, :accessories, :media, :furniture,
    :medicines, :other ]
  enumerize :category

  has_attached_file :image, styles: { medium: "500x500>", thumb: "100x100>" }

  validates_attachment_content_type :image,
    :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates :category, :quantity, :name, presence: true

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
