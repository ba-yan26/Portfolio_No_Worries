class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rooms, dependent: :destroy
  has_many :notices, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy

  has_one_attached :profile_image

  validates :name, presence: :true
  validates :email, presence: :true
  validates_acceptance_of :agreement, allow_nil: false, on: :create

  def get_profile_image
    profile_image.attached? ? profile_image : "no_image.jpg"
  end
end
