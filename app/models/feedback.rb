class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :feedback, presence: true
  validates :size_rating, :color_rating, :occasion_rating, :overall_style_rating, numericality:
  { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
