class Crop < ApplicationRecord
  belongs_to :farm

  validates :farm, presence: true
  validates :name, presence: true
  validates :availability, inclusion: { in: [true, false] }

  mount_uploader :image, ImageUploader
end
