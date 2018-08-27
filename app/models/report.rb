class Report < ApplicationRecord

  belongs_to :category
  belongs_to :user
  belongs_to :article, counter_cache: :count_of_reports


  validates :text, presence: true
  validates :article, uniqueness: {scope: :user}
end
