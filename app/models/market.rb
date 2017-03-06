class Market < ApplicationRecord
  
  has_and_belongs_to_many :farms

  validates :name, presence: true
  validates :address, presence: true

  geocoded_by :address, :latitude => :lat, :longitude => :lng
  after_validation :geocode

  reverse_geocoded_by :lat, :lng, :address => :parsed_address
  after_validation :reverse_geocode
end
