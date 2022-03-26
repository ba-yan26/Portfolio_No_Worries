class Category < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  validates :name, presence: :true
end
