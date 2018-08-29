class Conversation < ApplicationRecord

  attr_accessor :recipient_id, :message

  has_many    :conversations_users, dependent: :destroy
  has_many    :users, through: :conversations_users
  has_many    :messages, dependent: :destroy
  has_many    :notifications, dependent: :destroy

  validates  :subject,
             :conversations_users,
             :messages,
             presence: true

  validate :check_users_count

  accepts_nested_attributes_for :conversations_users, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :messages,            reject_if: :all_blank, allow_destroy: true

  private

  def check_users_count
    errors.add(:conversations_users, 'must be minimum two users') if conversations_users.size < 2
  end

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
