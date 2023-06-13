class NotificationsController < ApplicationController
  def index
    @notifications = Notification.all.order(created_at: :desc)
  end
end
