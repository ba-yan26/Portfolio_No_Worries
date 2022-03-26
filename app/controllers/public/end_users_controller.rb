class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!
  before_action :ensure_correct_end_user, only: [:edit]

  def show
    @end_user = EndUser.find(params[:id])
    @rooms = @end_user.rooms.page(params[:page]).per(5)
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update(end_user_params)
      redirect_to end_user_path(@end_user)
    else
      render "edit"
    end
  end

  def followings
    end_user = EndUser.find(params[:id])
    @end_users = end_user.followings
  end

  def followers
    end_user = EndUser.find(params[:id])
    @end_users = end_user.followers
  end

  def reviewers
    @end_user = EndUser.find(params[:id])
    @reviews = Review.where(reviewing: @end_user)
  end

  def ensure_correct_end_user
    @end_user = EndUser.find(params[:id])
    unless @end_user == current_end_user
      redirect_to end_user_path(current_end_user)
    end
  end

  private

  def end_user_params
    params.require(:end_user).permit(:name, :email, :body, :profile_image)
  end
end
