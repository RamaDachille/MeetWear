class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @posts = Post.where(post_type: "Share")
  end

  def profile
    if user_signed_in?
      @posts = Post.where(user_id: params[:id])
    else
      redirect_to new_user_session_path, alert: "Please sign in to access your profile."
    end
  end
end
