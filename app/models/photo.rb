class Photo < ApplicationRecord
    belongs_to :user
    has_many_attached :images
    has_many :hashtags, dependent: :destroy

    validates :text, length: { maximum: 2000 }
end
