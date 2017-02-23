class StockCrop < ApplicationRecord
  validates :name, presence: true
  validates :growstuff_id, presence: true
end
