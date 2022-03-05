class Room < ApplicationRecord
  belongs_to :category
  belongs_to :end_user
  has_many :bookmarks, dependent: :destroy
  has_many :chats, dependent: :destroy
end
