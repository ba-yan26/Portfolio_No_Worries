class AddBestAnswerIdToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :best_answer, :integer, default: nil
  end
end
