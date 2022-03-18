class Public::RoomsController < ApplicationController
  before_action :authenticate_end_user!

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
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true).order(created_at: :desc)
    @categories = Category.all
  end

  def show
    @room = Room.find(params[:id])
    @categories = Category.all
    @category = @room.category
    @chat = Chat.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to room_path(@room)
    else
      render 'edit'
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path
  end

  def resolution
    @rooms = Room.all
    @categories = Category.all
  end

  private

  def room_params
    params.require(:room).permit(:title, :body, :resolution_status, :category_id, :best_answer)
  end
end
