class Notice < ApplicationRecord
  belongs_to :end_user
  
  has_one_attached :notice_image
  
  def get_notice_image
    notice_image
  end
end
