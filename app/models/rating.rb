class Rating < ApplicationRecord

  belongs_to :ratingable,   polymorphic: true, required: true             # задаем связь, полигамность и ее отрибуты
  belongs_to :user,                            required: true

  #проверяем оценку, устанавливаем минимальное и максимальное значение
  validates :mark,
            numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 },
            presence: true

end

# == Schema Information
#
# Table name: ratings
#
#  id              :bigint(8)        not null, primary key
#  mark            :integer          not null
#  ratingable_type :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  ratingable_id   :bigint(8)        not null
#  user_id         :bigint(8)        not null
#
# Indexes
#
#  index_ratings_on_ratingable_type_and_ratingable_id  (ratingable_type,ratingable_id)
#  index_ratings_on_user_id                            (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
