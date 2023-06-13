class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    @comments = Comment.where(post_id: @post.id).order(created_at: :desc)
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.post = @post
    @comment.user = current_user
    if @comment.save!
      redirect_to post_comments_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end

  def create_notification
    Notification.create(user: post.user, post: post, message: 'A new comment was posted on your post.')
  end
end
