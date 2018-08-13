class Article < ApplicationRecord

  belongs_to :user

  has_many :comments, dependent: :destroy

  validates :title,
            :creator_ip_address,
            presence: true

  validates :title,
            length: { minimum: 5 }


end
