class Farm < ApplicationRecord
  has_many :crops
  has_and_belongs_to_many :markets

  validates :name, presence: true
  validates :farmer, presence: true
end
