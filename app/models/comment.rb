class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, presence: true

  after_create :create_notification

  private

  def create_notification
    Notification.create(
      user: post.user,
      post: post,
      message: 'A new comment has been posted on your post.'
    )
  end
end
