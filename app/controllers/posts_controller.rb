class PostsController < ApplicationController
  def ask_index
    @posts = Post.where(post_type: "Ask")
  end

  def share_index
    @posts = Post.where(post_type: "Share")
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = Comment.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save!
      redirect_to post_path(@post), notice: "Your post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:post_type, :description, :category, :gender, :occasion, :brand_tag, :size_rating, :photo)
  end
end
