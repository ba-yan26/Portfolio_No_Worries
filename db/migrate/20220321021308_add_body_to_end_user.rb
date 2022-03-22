class AddBodyToEndUser < ActiveRecord::Migration[6.1]
  def change
    add_column :end_users, :body, :text
  end
end
