require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: reports
#
#  id          :bigint(8)        not null, primary key
#  text        :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  article_id  :bigint(8)        not null
#  category_id :bigint(8)        not null
#  user_id     :bigint(8)        not null
#
# Indexes
#
#  index_reports_on_article_id              (article_id)
#  index_reports_on_category_id             (category_id)
#  index_reports_on_user_id                 (user_id)
#  index_reports_on_user_id_and_article_id  (user_id,article_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (article_id => articles.id)
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (user_id => users.id)
#
