class Public::NoticesController < ApplicationController
  before_action :authenticate_end_user!

  def new
    @notice = Notice.new
    @end_user = EndUser.find(params[:end_user_id])
  end

  def create
    @notice = Notice.new(notice_params)
    if @notice.save
      redirect_to rooms_path
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def notice_params
    params.require(:notice).permit(:title, :body, :notice_image).merge(end_user_id: params[:end_user_id])
  end
end
 