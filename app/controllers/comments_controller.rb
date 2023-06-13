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

  def like
    @comment = Comment.find(params[:comment_id])
    @comment_like = CommentLike.find_by(comment: @comment, user: current_user)
    if @comment_like
      @comment_like.destroy
    else
      CommentLike.create(comment: @comment, user: current_user)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
