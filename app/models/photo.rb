class Photo < ApplicationRecord
    belongs_to :user
    has_attached_file :images
    has_many :hashtags, dependent: :destroy

    validates_attachment_presence :images
end
