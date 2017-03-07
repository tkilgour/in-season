class Box < ApplicationRecord

  belongs_to :farm
  
  # validates :size, presence: true
  # validates :quantity, presence: true
  # validates :farm, presence: true

end
