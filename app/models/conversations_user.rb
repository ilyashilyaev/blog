class ConversationsUser < ApplicationRecord

  belongs_to :user,         required: true
  belongs_to :conversation, required: true

  validates :user, uniqueness: {scope: :conversation}

end

# == Schema Information
#
# Table name: conversations_users
#
#  id              :bigint(8)        not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  conversation_id :bigint(8)        not null
#  user_id         :bigint(8)        not null
#
# Indexes
#
#  index_conversations_users_on_conversation_id              (conversation_id)
#  index_conversations_users_on_user_id                      (user_id)
#  index_conversations_users_on_user_id_and_conversation_id  (user_id,conversation_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (conversation_id => conversations.id)
#  fk_rails_...  (user_id => users.id)
#
