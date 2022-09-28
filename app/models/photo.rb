class Photo < ApplicationRecord
    belongs_to :user
    has_many_attached :images
    has_many :hashtags, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy

    validates :text, length: { maximum: 1200 }
end
