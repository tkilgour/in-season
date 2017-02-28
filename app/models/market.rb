class Market < ApplicationRecord
  has_and_belongs_to_many :farms

  geocoded_by :address, :latitude => :lat, :longitude => :lng
  after_validation :geocode
end
