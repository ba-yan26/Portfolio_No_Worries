class Public::NoticesController < ApplicationController

  def new
    @notice = Notice.new
  end

  def create
    @notice = Notice.new(notice_params)
    @notice.save
    redirect_to room_path(room)
  end
end
