class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :photos, dependent: :destroy
  has_many :likes

  validates :username, presence: true, length: { maximum: 35 }, uniqueness: true
  validates :name, length: { maximum: 30 }
  validates :website, length: { maximum: 100 }
  validates :bio, length: { maximum: 500 }

  validates :avatar, file_size: { less_than_or_equal_to: 10.megabytes },
            file_content_type: { allow: ['image/jpeg', 'image/png', 'image/webp'] }
end
