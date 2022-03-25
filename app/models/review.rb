class Review < ApplicationRecord
  
  belongs_to :reviewing, class_name: "EndUser"
  belongs_to :reviewer, class_name: "EndUser"
  
  validates :comment, presence: :true, length: {maximum: 140}
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1}, presence: true
end
