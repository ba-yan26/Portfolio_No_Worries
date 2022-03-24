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
  # 自分からの通知
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy
  # 相手からの通知
  has_many :relationships, foreign_key: :following_id
  has_many :followings, through: :relationships, source: :follower
  # ユーザーがフォローしている人をrelationshipsテーブルを介して取ってくる
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :reverse_of_relationships, source: :following
  # ユーザーをフォローしている人をrelationshipsテーブルを介して取ってくる
  has_many :reviews, dependent: :destroy

  has_one_attached :profile_image

  validates :name, uniqueness: :true, presence: :true
  validates :email, presence: :true
  validates :body, length: {maximum: 140}
  validates_acceptance_of :agreement, allow_nil: false, on: :create

  def get_profile_image
    profile_image.attached? ? profile_image : "no_image.jpg"
  end

  def is_followed_by?(end_user)
    reverse_of_relationships.find_by(following_id: end_user.id).present?
    # 引数に渡されているユーザーがフォローされているかどうか
  end
end
