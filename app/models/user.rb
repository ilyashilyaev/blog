class User < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles,   dependent: :destroy
  has_many :comments,   dependent: :destroy
  has_many :favorites,  dependent: :destroy
  has_many :my_favorite_articles, through: :favorites, source: :article, foreign_key: :article_id
  has_many :reports,    dependent: :destroy

  has_many :conversation_users, dependent: :destroy
  has_many :conversations,      through: :conversation_users
  has_many :notifications,      dependent: :destroy
  has_many :messages,           dependent: :destroy

  mount_uploader :avatar, AttachmentUploader

  validates :avatar,
            file_size: { less_than: 2.megabytes }

  validates :nickname,
            presence: true,
            uniqueness: true

  validates :email,
            presence: true,
            length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX }


  def active_for_authentication?
    super && !self.is_blocked
  end


end

# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  avatar                 :string
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string           not null
#  is_admin               :boolean          default(FALSE), not null
#  is_blocked             :boolean          default(FALSE), not null
#  last_name              :string           not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  nickname               :string           not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_nickname              (nickname) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
