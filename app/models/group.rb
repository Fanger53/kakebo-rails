class Group < ApplicationRecord
  belongs_to :user
  has_many :transfers
  has_one_attached :icon_image
  after_commit :add_default_icon_image, on: [:create, :update]

  private 
  def add_default_icon_image
    unless icon_image.attached?
      self.icon_image.attach(io: File.open(Rails.root.join("app", "assets", "images", "default.jpg")), filename: 'default.jpg' , content_type: "image/jpg")
    end
  end
end
