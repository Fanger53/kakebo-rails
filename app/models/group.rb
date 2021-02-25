class Group < ApplicationRecord
  belongs_to :user
  has_many :transfers
  has_one_attached :icon_image
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  after_commit :add_default_icon_image, on: %i[create update]

  private

  def add_default_icon_image
    return if icon_image.attached?

    icon_image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default.jpg')),
                      filename: 'default.jpg', content_type: 'image/jpg')
  end
end
