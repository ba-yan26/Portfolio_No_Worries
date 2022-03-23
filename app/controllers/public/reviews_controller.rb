class Public::ReviewsController < ApplicationController
  before_action :authenticate_end_user!

  def new
    @review = Review.new
    @end_user = EndUser.find(params[:end_user_id])
  end

  def create
    @review = Review.new(review_params)
    @review.end_user.id = current_end_user.id
    if @review.save
      redirect_to rooms_path
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @end_user = EndUser.find(params[:id])
    @reviews = @end_user.reviews
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rate).merge(end_user_id: params[:end_user_id])
  end
end
