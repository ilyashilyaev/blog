class Article < ApplicationRecord

  belongs_to :user

  has_many :comments, dependent: :destroy

  has_many :ratings, as: :ratingable, dependent: :destroy         #прописываем отношение, полигамность, удаление рейтинга после удаления поста


  mount_uploader :attachment, AttachmentUploader

  validates :title,
            :creator_ip_address,
            :text,
            presence: true

  validates :title,
            length: { minimum: 5 }


end
