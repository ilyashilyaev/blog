class Rating < ApplicationRecord

  belongs_to :ratingable, polymorphic: true, required: true             # задаем связь, полигамность и ее отрибуты
  belongs_to :user, required: true

    #создает оценку, устанавливаем минимальное и максимальное значение

  validates :mark,
            numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 },
            presence: true

end
