class Farm < ApplicationRecord
  has_many :products

  validates :name, presence: true
  validates :farmers, presence: true
  
end
