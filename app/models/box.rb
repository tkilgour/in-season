class Box < ApplicationRecord

  belongs_to :farm

  monetize :pickup_price_cents, numericality: true
  monetize :delivery_price_cents, numericality: true

  validates :size, presence: true
  validates :pickup_price_cents, presence: true
  validates :delivery_price_cents, presence: true
  validates :quantity, presence: true
  validates :farm, presence: true

end
