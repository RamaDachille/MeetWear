class Post < ApplicationRecord
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :saved_posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :feedbacks, dependent: :destroy

  validates :post_type, :description, :category, :occasion, :brand_tag, presence: true
  validates :size_rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
