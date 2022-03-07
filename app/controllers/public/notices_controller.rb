class Public::NoticesController < ApplicationController

  def new
    @notice = Notice.new
    @end_user = EndUser.find(params[:end_user_id])
  end

  def create
    @notice = Notice.new(notice_params)
    @notice.save
    redirect_to rooms_path
  end

  private

  def notice_params
    params.require(:notice).permit(:title, :body, :notice_image).merge(end_user_id: params[:end_user_id])
  end
end
 