class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.new()
    @like.post = @post
    @like.user = current_user
    @like.save
    redirect_to root_path
  end
end
