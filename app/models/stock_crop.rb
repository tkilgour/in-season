class StockCrop < ApplicationRecord
  attr_accessor :name

  validates :name, presence: true
  validates :growstuff_id, presence: true
end
