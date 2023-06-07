class FeedbacksController < ApplicationController
  class CommentsController < ApplicationController
    def create
      @feedback = feedback.new(feedback_params)
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
      params.require(:feedback).permit(:content, :post_id)
    end
  end
end
