class HomesController < ApplicationController
  before_action :ensure_correct_unsubscribe, only: [:unsubscribe]

  def top
  end

  def confirm_notice
  end

  def unsubscribe
    @end_user = EndUser.find(params[:id])
  end

  def withdraw
    @end_user = current_end_user
    @end_user.update(is_delete: true)
    reset_session
    redirect_to root_path
  end

  def ensure_correct_unsubscribe
    @end_user = EndUser.find(params[:id])
    unless @end_user == current_end_user
      redirect_to end_user_path(current_end_user)
    end
  end
end
