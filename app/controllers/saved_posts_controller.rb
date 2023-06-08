class SavedPostsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @saved_post = SavedPost.where(post_id: @post.id, user_id: current_user.id).first

    if @saved_post
      @saved_post.destroy
    else
      @saved_post = SavedPost.new()
      @saved_post.post = @post
      @saved_post.user = current_user
      @saved_post.save
    end
    redirect_to root_path
  end
end
