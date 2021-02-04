class Group < ApplicationRecord
  belongs_to :user
  has_many :transfers
  has_one_attached :icon_image
end
