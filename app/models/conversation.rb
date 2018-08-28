class Conversation < ApplicationRecord

  has_many    :conversation_users, dependent: :destroy
  has_many    :messages, dependent: :destroy
  has_many    :notifications, dependent: :destroy

  validates  :subject, presence: true

end

# == Schema Information
#
# Table name: conversations
#
#  id         :bigint(8)        not null, primary key
#  subject    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
