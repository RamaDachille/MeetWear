class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :likes, through: :comment_likes
  validates :content, presence: true

  # after_create :create_notification

  # private

  # def create_notification
  #   Notification.create(
  #     user: post.user,
  #     post: post,
  #     message: "#{user.user_name} commented on your post"
  #   )
  # end
  # def create_notification
  #   Notification.create(
  #     user_id: post.user_id,
  #     post_id: post.id,
  #     message: "Your post received a comment."
  #   )
  # end
end
