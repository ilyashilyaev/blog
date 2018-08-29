class Message < ApplicationRecord

  belongs_to :conversation,   required: true
  belongs_to :user,           required: true

  has_many   :notifications,  dependent: :destroy

  validates :text,
            presence: true,
            length: { maximum: 2_000 }

end

# == Schema Information
#
# Table name: messages
#
#  id              :bigint(8)        not null, primary key
#  text            :text             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  conversation_id :bigint(8)        not null
#  user_id         :bigint(8)        not null
#
# Indexes
#
#  index_messages_on_conversation_id  (conversation_id)
#  index_messages_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (conversation_id => conversations.id)
#  fk_rails_...  (user_id => users.id)
#
