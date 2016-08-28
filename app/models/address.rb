class Address < ApplicationRecord
  belongs_to :resource, polymorphic: true

  validates :address_line, :city, :state, :pincode, presence: true

  def display_address
    [address_line, city, pincode, state].reject(&:blank?).join(', ')
  end
end
