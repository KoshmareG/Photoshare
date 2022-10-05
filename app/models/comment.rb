class Comment < ApplicationRecord
  belongs_to :photo
  belongs_to :user
  belongs_to :parent, class_name: 'Comment', optional: true
  has_many :comments, foreign_key: :parent_id

  validates :text, presence: true, length: { maximum: 300 }

  default_scope { order(id: :desc) }
end
