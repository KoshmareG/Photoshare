class Photo < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :hashtags, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :last_comments, -> { limit(3) }, class_name: 'Comment'

  validates :text, length: { maximum: 1200 }
end
