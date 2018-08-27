class Category < ApplicationRecord

  has_many :article
  has_many :report

  enum type_of:  {
      article: 0,
      report: 1
  }
end
