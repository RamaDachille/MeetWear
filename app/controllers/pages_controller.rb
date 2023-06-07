class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @posts = Post.where(post_type: "Share")
  end

  def profile
    @posts = Post.where(user_id: params[:id])
  end
end
