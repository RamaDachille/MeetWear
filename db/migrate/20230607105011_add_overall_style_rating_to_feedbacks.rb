class AddOverallStyleRatingToFeedbacks < ActiveRecord::Migration[7.0]
  def change
    add_column :feedbacks, :overall_style_rating, :integer
  end
end
