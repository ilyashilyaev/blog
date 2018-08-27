class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :my_favorite_articles, through: :favorites, source: :article, foreign_key: :article_id
  has_many :reports, dependent: :destroy

  mount_uploader :avatar, AttachmentUploader

  validates :avatar, file_size: { less_than: 2.megabytes }

  validates :nickname, presence: true, uniqueness: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX }

  def active_for_authentication?
    super && !self.is_blocked
  end


end
