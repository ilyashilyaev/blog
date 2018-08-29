class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|

      t.references :user, null: false, foreign_key: true
      t.references :message, null:false, foreign_key: true
      t.references :conversation, null: false, foreign_key: true

      t.timestamps
    end
    add_index(:notifications, [:user_id, :conversation_id, :message_id], unique: true, name: 'index_notifications_on_user_and_conversation_and_massage')
  end
end
