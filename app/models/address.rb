class Address < ApplicationRecord
  belongs_to :resource, polymorphic: true
end
