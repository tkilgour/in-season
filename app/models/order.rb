class Order < ApplicationRecord

  belongs_to :user
  has_many :order_items

  # monetize :total_price_cents, numericality: true

  validates :stripe_charge_id, presence: true

end
