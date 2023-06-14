class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_favoritor

  has_many :notifications, dependent: :destroy
  has_many :followers, through: :user_followers
  has_many :followed, through: :user_followers
  has_one_attached :photo

  has_many :followers, dependent: :destroy
  has_many :followed, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  has_many :posts, dependent: :destroy

  has_many :comments, dependent: :destroy
  has_many :saved_posts, dependent: :destroy
  has_many :comment_likes, dependent: :destroy
end
