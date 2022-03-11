class Public::BookmarksController < ApplicationController
  before_action :authenticate_end_user!

  def index
    @rooms = Room.all.order(created_at: :desc)
    @categories = Category.all
  end

  def create
    @room = Room.find(params[:room_id])
    bookmark = current_end_user.bookmarks.new(room_id: @room.id)
    bookmark.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @room = Room.find(params[:room_id])
    bookmark = current_end_user.bookmarks.find_by(room_id: @room.id)
    bookmark.destroy
    redirect_back(fallback_location: root_path)
  end
end
