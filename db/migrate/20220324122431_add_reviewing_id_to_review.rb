class AddReviewingIdToReview < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :reviewing_id, :integer
  end
end
