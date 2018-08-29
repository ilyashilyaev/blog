require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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
