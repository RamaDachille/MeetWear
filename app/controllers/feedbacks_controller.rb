class FeedbacksController < ApplicationController
  def create
    @feedback = Feedback.new(feedback_params)
    @post = Post.find(params[:post_id])
    @feedback.post = @post
    @feedback.user = current_user
    if @feedback.save!
      redirect_to post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:category, :feedback, :size_rating, :color_rating, :occasion_rating, :overall_style_rating)
  end
end
