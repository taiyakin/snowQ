class Skiresort < ApplicationRecord
  has_ancestry
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
