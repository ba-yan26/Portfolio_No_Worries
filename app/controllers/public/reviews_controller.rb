class Public::ReviewsController < ApplicationController
  before_action :authenticate_end_user!

  def new
    @review = Review.new
    @end_user = EndUser.find(params[:end_user_id])
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to rooms_path
    else
      redirect_back(fallback_location: root_path)
    end
  end


  private

  def review_params
    params.require(:review).permit(:comment, :rate).merge(reviewer_id: current_end_user.id, reviewing_id: params[:end_user_id])
  end
end
