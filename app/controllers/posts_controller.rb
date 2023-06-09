class PostsController < ApplicationController
  before_action :authenticate_user!, only: :toggle_favorite
  def toggle_favorite
    @post = Post.find_by(id: params[:id])
    current_user.favorited?(@post) ? current_user.unfavorite(@post) : current_user.favorite(@post)
  end

  def ask_index
    @posts = Post.where(post_type: "Ask").order(created_at: :desc)
  end

  def share_index
    @posts = Post.where(post_type: "Share").order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @feedback = Feedback.new
    @comments = Comment.where(post_id: @post.id)
    @feedbacks = Feedback.where(post_id: @post.id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.brand_tag = params[:commit]
    @post.user_id = current_user.id
    if @post.save!
      if @post.post_type == 'Share'
        redirect_to root_path, notice: "Your post was successfully created."
      else
        redirect_to ask_feed_path
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:post_type, :description, :category, :gender, :occasion, :brand_tag, :size_rating, :photo)
  end
end
