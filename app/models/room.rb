class Room < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :chats

end
