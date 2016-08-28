class Item < ApplicationRecord
  extend EnumAttribute

  belongs_to :receiver, class_name: "Ngo", required: false
  belongs_to :donor, class_name: "Volunteer"
  has_one :address, through: :donor

  enum category: [ :book, :clothes, :shoes, :accessories, :media, :furniture,
    :medicines, :other ]
  enumerize :category

  has_attached_file :image, styles: { medium: "400x400>", thumb: "100x100>" }

  validates_attachment_content_type :image,
    :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates :category, :quantity, :name, presence: true

  before_create :set_initial_state

  def set_initial_state
    self.state = "pending" if state.blank?
  end

  def accept!
    self.update_column(:state, "ngo_accepted")
  end

  def accepted?
    state == "ngo_accepted"
  end

  def confirmed?
    state == "volunteer_confirmed"
  end

  def pending?
    state == "pending"
  end

  def received?
    state == "ngo_received"
  end

  def reject!
    self.update_column(:state, "pending")
  end

  def confirm!
    self.update_column(:state, "volunteer_confirmed")
  end

  def received!
    self.update_column(:state, "ngo_received")
  end

  class << self
    def pending_donations
      where(state: "pending")
    end

    def list_donations_for_ngo(ngo_id)
      where("items.state = 'pending' OR items.receiver_id = (?)", ngo_id)
    end
  end
end
