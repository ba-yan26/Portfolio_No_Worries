class Public::ChatsController < ApplicationController
  before_action :authenticate_end_user!

  def create
    @room = Room.find(params[:room_id])
    chat = current_end_user.chats.new(chat_params)
    chat.room_id = @room.id
    chat.save
    @room.create_notification_by(current_end_user, chat.id)
    # roomモデル内のメソッドを呼び出す
  end

  def destroy
    @room = Room.find(params[:room_id])
    chat = Chat.find(params[:id])
    chat.destroy
  end

  private

  def chat_params
    params.require(:chat).permit(:message)
  end

end
