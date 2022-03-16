class Room < ApplicationRecord
  belongs_to :category
  belongs_to :end_user
  has_many :bookmarks, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :notifications, dependent: :destroy

  def is_bookmarked_by?(end_user)
    bookmarks.exists?(end_user_id: end_user.id)
  end
  
  def create_notification_chat!(current_end_user, chat_id)
    temp_ids = Chat.select(:end_user_id).where(room_id: id).where.not(end_user_id: current_end_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_chat!(current_end_user, chat_id, temp_id["end_user_id"])
    end
    
    save_notification_chat!(current_end_user, chat_id, end_user_id)if temp_ids.blank?
  end
  
  def save_notification_chat!(current_end_user, chat_id, visited_id)
    notification = current_end_user.active_notifications.new(
      room_id: id,
      chat_id: chat_id,
      visited_id: visited_id,
      action: "chat"
    )
    
    if notification.visiter_id == notification.visited_id
      notification.checked = true
    end
      notification.save if notification.valid?
  end

end
