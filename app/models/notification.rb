class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :comment_user, class_name: "User", foreign_key: "comment_user_id", optional: true
end
