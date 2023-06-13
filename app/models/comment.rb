class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :likes, through: :comment_likes
  validates :content, presence: true
end
