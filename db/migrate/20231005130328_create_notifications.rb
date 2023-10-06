class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.references :user,foreign_key: true 
      t.references :content,foreign_key: true 
      t.string :status, default: "unread"
      t.string :notification
      # read or unread notifications
      t.timestamps
    end
  end
end
