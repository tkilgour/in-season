class Farm < ApplicationRecord
  belongs_to :user
  has_many :crops

  # validates :user_id, presence: true
  validates :name, presence: true
  validates :farmer, presence: true

  mount_uploader :banner_image, BannerUploader
  mount_uploader :profile_image, AvatarUploader

end
