class SavedPostsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @saved_post = SavedPost.new()
    @saved_post.post = @post
    @saved_post.user = current_user
    @saved_post.save
    redirect_to root_path
  end
end
