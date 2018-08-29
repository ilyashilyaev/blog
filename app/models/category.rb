class Category < ApplicationRecord

  has_many :article
  has_many :report

  enum type_of:  {
      article: 0,
      report: 1
  }
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
