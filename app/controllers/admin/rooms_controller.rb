class Admin::RoomsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @rooms = Room.all
    @categories = Category.all
  end

  def show
    @room = Room.find(params[:id])
  end
end
