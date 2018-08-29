require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: categories
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  type_of    :integer          default("article"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
