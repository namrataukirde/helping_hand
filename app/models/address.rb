class Address < ApplicationRecord
  belongs_to :resource, polymorphic: true

  validates :address_line, :city, :country, :state, :pincode, presence: true
end
