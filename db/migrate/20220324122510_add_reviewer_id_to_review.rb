class AddReviewerIdToReview < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :reviewer_id, :integer
  end
end
