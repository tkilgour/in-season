class Product < ApplicationRecord
  belongs_to :farm

  validates :farm, presence: true
  validates :name, presence: true
  validates :availability, presence: true
end
