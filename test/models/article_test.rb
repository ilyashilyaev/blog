require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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
