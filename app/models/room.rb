class Room < ApplicationRecord
  belongs_to :category
  belongs_to :end_user
  has_many :bookmarks, dependent: :destroy
  has_many :chats, dependent: :destroy

  def is_bookmarked_by?(end_user)
    bookmarks.exists?(end_user_id: end_user.id)
  end
end
