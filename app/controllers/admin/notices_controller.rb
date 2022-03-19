class Admin::NoticesController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @notices = Notice.all
  end

  def show
    @notice = Notice.find(params[:id])
  end
  
end
