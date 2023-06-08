class Post < ApplicationRecord
  belongs_to :user

  has_one_attached :photo

  acts_as_favoritor

  has_many :likes, dependent: :destroy
  has_many :saved_posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :feedbacks, dependent: :destroy

  validates :post_type, :description, :category, :occasion, presence: true
end
