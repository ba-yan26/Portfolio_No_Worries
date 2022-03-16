module Public::NotificationsHelper
  
  def notification_form(notification)
    @visiter = notification.visiter
    @chat = nil
    @visiter_chat = notification.chat_id
    
    case notification.action
      when "chat" then
        @chat = Chat.find_by(id: @visiter_chat)
        tag.a(@visiter.name, href:end_user_path(@visiter), style:"font-weight: bold;")+"が"+tag.a("あなたの投稿",href:room_path(notification.room_id), style:"font-weight: bold;")+"にコメントしました"
    end
  end
  
  def unchecked_notifications
    @notifications = current_end_user.passive_notifications.where(checked: false)
  end
end
