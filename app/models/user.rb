class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  has_many :transfers
  has_many :groups
  has_one_attached :avatar
  validates :username, presence: true, length: { in: 3..15 }
  validates :username, uniqueness: true
  validates :username, format: { with: /[a-zA-Z0-9]/ }
  after_commit :add_default_avatar, on: %i[create update]

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create  do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  private

  def add_default_avatar
    return if avatar.attached?

    avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default.jpg')),
                  filename: 'default.jpg', content_type: 'image/jpg')
  end
end
