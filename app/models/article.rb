class Article < ApplicationRecord

  belongs_to :user
  # belongs_to :category

  has_many :comments, dependent: :destroy

  has_many :ratings, as: :ratingable, dependent: :destroy         #прописываем отношение, полигамность, удаление рейтинга после удаления поста

  has_many :favorites, dependent: :destroy
  has_many :reports, dependent: :destroy


  mount_uploader :attachment, AttachmentUploader

  validates :attachment, file_size: { less_than: 2.megabytes }
  validates :title,
            :creator_ip_address,
            :text,
            presence: true

  validates :title,
            length: { minimum: 5 }

# создаем method
  def has_favorite?(user)
    favorites.find_by(user: user).present?
  end

  def has_report?(user)
    reports.find_by(user: user).present?
  end

end

# == Schema Information
#
# Table name: articles
#
#  id                 :integer          not null, primary key
#  attachment         :string
#  count_of_comments  :integer          default(0), not null
#  count_of_reports   :integer          default(0), not null
#  creator_ip_address :string           not null
#  rating             :integer          default(0), not null
#  text               :text             not null
#  title              :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer          not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
