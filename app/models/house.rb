class House < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  has_many :specifications

  enum type: [:apartment, :shared, :house]
  enum status: [:sell, :rent]
end
