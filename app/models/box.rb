class Box < ApplicationRecord

  belongs_to :farm

  # monetize :price_cents, numericality: true

  # validates :size, presence: true
  # validates :quantity, presence: true
  # validates :farm, presence: true

end
