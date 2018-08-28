class CreateConversationUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :conversation_users do |t|

      t.references :user, null: false, foreign_key: true
      t.references :conversation, null: false, foreign_key: true

      t.timestamps
    end
    add_index(:conversation_users, [:user_id, :conversation_id],unique: true)
  end
end
