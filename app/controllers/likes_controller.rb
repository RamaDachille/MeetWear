class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.where(post_id: @post.id, user_id: current_user.id).first

    if @like
      @like.destroy
    else
      @like = Like.new
      @like.post = @post
      @like.user = current_user
      @like.save
    end
    redirect_to root_path
  end
end
