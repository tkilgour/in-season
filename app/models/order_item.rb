class OrderItem < ApplicationRecord

  belongs_to :order
  belongs_to :box

  # monetize :item_price_cents, numericality: true
  # monetize :total_price_cents, numericality: true

end
