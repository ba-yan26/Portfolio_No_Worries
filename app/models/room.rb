class Room < ApplicationRecord
  belongs_to :category
  belongs_to :end_user
  has_many :bookmarks, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :notifications, dependent: :destroy

  def is_bookmarked_by?(end_user)
    bookmarks.exists?(end_user_id: end_user.id)
  end
  
  def create_notification_by(current_end_user)
    notification = current_end_user.active_notifications.new(
    # ログインしているユーザーが自分からの通知を作成する
    # 以下3行の情報を取得して通知の作成をする
      room_id: id,
      visited_id: end_user_id,
      action: 'chat'
    )
    
    if notification.visiter_id == notification.visited_id
    # 通知を作成した人のidと通知を受け取る人のidが同じなら
      notification.checked = true
      # true(既読)にする
    end
    
    notification.save
    # 通知をセーブして
      if notification.valid?
      # エラーがなければtrueを返す
      end
  end
end
