class Order < ApplicationRecord

  belongs_to :user
  has_many :order_items

  validates :stripe_charge_id, presence: true

end
