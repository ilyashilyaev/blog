class Notification < ApplicationRecord

  belongs_to :user,         required: true
  belongs_to :message,      required: true
  belongs_to :conversation, required: true

end

# == Schema Information
#
# Table name: notifications
#
#  id              :bigint(8)        not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  conversation_id :bigint(8)        not null
#  message_id      :bigint(8)        not null
#  user_id         :bigint(8)        not null
#
# Indexes
#
#  index_notifications_on_conversation_id                    (conversation_id)
#  index_notifications_on_message_id                         (message_id)
#  index_notifications_on_user_and_conversation_and_massage  (user_id,conversation_id,message_id) UNIQUE
#  index_notifications_on_user_id                            (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (conversation_id => conversations.id)
#  fk_rails_...  (message_id => messages.id)
#  fk_rails_...  (user_id => users.id)
#
