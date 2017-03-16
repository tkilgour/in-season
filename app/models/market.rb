class Market < ApplicationRecord
  acts_as_mappable :default_units => :kms
  before_validation :geocode, :on => :create

  has_and_belongs_to_many :farms

  validates :name, presence: true
  validates :address, presence: true

  private
  def geocode
    geo = Geokit::Geocoders::GoogleGeocoder.geocode (address)
    errors.add(:address, "Could not Geocode address") if !geo.success
    self.lat, self.lng = geo.lat,geo.lng if geo.success

    res = Geokit::Geocoders::GoogleGeocoder.reverse_geocode [self.lat, self.lng]
    self.parsed_address = res.full_address
  end
end
