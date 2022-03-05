class Public::ChatsController < ApplicationController

  def create
    @room = Room.find(params[:room_id])
    chat = current_end_user.chats.new(chat_params)
    chat.room_id = @room.id
    chat.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @room = Room.find(params[:room_id])
    chat = Chat.find(params[:id])
    chat.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def chat_params
    params.require(:chat).permit(:message)
  end

end
