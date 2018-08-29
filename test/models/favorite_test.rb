require 'test_helper'

class FavoriteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: favorites
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :bigint(8)
#  user_id    :bigint(8)
#
# Indexes
#
#  index_favorites_on_article_id              (article_id)
#  index_favorites_on_article_id_and_user_id  (article_id,user_id) UNIQUE
#  index_favorites_on_user_id                 (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (article_id => articles.id)
#  fk_rails_...  (user_id => users.id)
#
