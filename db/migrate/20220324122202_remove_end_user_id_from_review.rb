class RemoveEndUserIdFromReview < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :end_user_id, :integer
  end
end
