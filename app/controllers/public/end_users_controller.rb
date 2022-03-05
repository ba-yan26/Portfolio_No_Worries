class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!
  before_action :ensure_correct_end_user, only: [:show, :edit]



  def show
    @end_user = EndUser.find(params[:id])
    @rooms = current_end_user.rooms
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    @end_user.update(end_user_params)
    redirect_to end_user_path(@end_user)
  end

  def ensure_correct_end_user
    @end_user = EndUser.find(params[:id])
    unless @end_user == current_end_user
      redirect_to end_user_path(current_end_user)
    end
  end

  private

  def end_user_params
    params.require(:end_user).permit(:name, :email)
  end

end
