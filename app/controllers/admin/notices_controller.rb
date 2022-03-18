class Admin::NoticesController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @notices = Notice.all
  end
  
  def category
    @notices = Notice.all
    @notice = Notice.new
  end
  
  def create
    notice = Notice.new(notice_params)
    notice.save
    redirect_back(fallback_location: root_path)
  end
  
  def edit
    @notice = Notice.find(params[:id])
  end
  
  def update
    notice = Notice.find(params[:id])
    notice.update(notice_params)
    redirect_to admin_notice_categories_path
  end
  
  def destroy
    notice = Notice.find(params[:id])
    notice.destroy
    redirect_back(fallback_location: root_path)
  end

  def show
    @notice = Notice.find(params[:id])
  end
  
  private
  
  def notice_params
    params.require(:notice).permit(:name)
  end
end
