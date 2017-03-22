class House < ApplicationRecord
  mount_uploaders :images, HouseImageUploader
  serialize :images, JSON # If you use SQLite, add this line.  geocoded_by :address

  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  has_many :specifications

  enum house_type: [:apartment, :shared, :house]
  enum status: [:sell, :rent]
end
