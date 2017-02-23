class Farm < ApplicationRecord
  has_many :crops

  validates :name, presence: true
  validates :farmer, presence: true
end
