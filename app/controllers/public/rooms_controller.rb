class Public::RoomsController < ApplicationController
  def new
    @room = Room.new
    @categories = Category.all
  end

  def create
    @room = Room.new(room_params)
    @room.end_user_id = current_end_user.id
    @room.save
    redirect_to room_path(@room)
  end

  def index
    @rooms = Room.all
    @categories = Category.all
  end

  def show
    @room = Room.find(params[:id])
    @categories = Category.all
  end

  def destory

  end

  private

  def room_params
    params.require(:room).permit(:title, :body, :resolution_status, :category_id)
  end
end
