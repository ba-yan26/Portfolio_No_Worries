class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  # 作成日時を降順で

  belongs_to :room, optional: true
  belongs_to :chat, optional: true
  belongs_to :visiter, class_name: "EndUser", optional: true
  belongs_to :visited, class_name: "EndUser", optional: true
end
