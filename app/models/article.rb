class Article < ApplicationRecord

  belongs_to :user

  has_many :comments, dependent: :destroy

  has_many :ratings, as: :ratingable, dependent: :destroy         #прописываем отношение, полигамность, удаление рейтинга после удаления поста

  has_many :favorites, dependent: :destroy

  mount_uploader :attachment, AttachmentUploader

  validates :attachment, file_size: { less_than: 2.megabytes }
  validates :title,
            :creator_ip_address,
            :text,
            presence: true

  validates :title,
            length: { minimum: 5 }

# создаем класс
  def has_favorite?(user)
    favorites.find_by(user: user).present?
  end

end
