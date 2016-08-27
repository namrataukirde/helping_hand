class Address < ApplicationRecord
  belongs_to :resource, polymorphic: true

  def display_address
    [address_line, city, pincode, state, country].reject(&:blank?).join(', ')
  end
end
