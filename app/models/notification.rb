class Notification < ApplicationRecord
  
  default_scope -> {order(created_at: :desc)}
  
  belongs_to :room, optional: true
  belongs_to :chat, optional: true
  belongs_to :visiter, class_name: "EndUser", foreign_key: "visiter_id", optional: true
  belongs_to :visited, class_name: "EndUser", foreign_key: "visited_id", optional: true
end
