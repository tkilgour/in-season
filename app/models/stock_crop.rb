class StockCrop < ApplicationRecord
  validates :name, presence: true
  validates :growstuff_id, presence: true

  def self.search(term)
    where('name ILIKE :term', term: "%#{term.downcase}%")
  end
end
