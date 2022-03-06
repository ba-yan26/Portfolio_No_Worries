class Public::NoticesController < ApplicationController

  def new
    @notice = Notice.new
  end

  def create
    @notice = Notice.new(notice_params)
    @notice.save
    redirect_to rooms_path
  end

  private

  def notice_params
    params.require(:notice).permit(:title, :body, :end_user_id, :notice_image)
  end
end
