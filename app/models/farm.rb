class Farm < ApplicationRecord
  belongs_to :user
  has_many :crops

  # validates :user_id, presence: true
  validates :name, presence: true
  validates :farmer, presence: true
end
