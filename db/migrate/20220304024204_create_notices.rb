class CreateNotices < ActiveRecord::Migration[6.1]
  def change
    create_table :notices do |t|
      t.integer :end_user_id, null: false
      t.string :name
      t.text :body, null: false

      t.timestamps
    end
  end
end
