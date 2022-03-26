class Notice < ApplicationRecord
  belongs_to :end_user

  has_one_attached :notice_image

  validates :title, presence: :true
  validates :body, presence: :true
  validates :notice_image, presence: :true

  def get_notice_image
    notice_image.attached? ? notice_image : "no_image.jpg"
  end
end
