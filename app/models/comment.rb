class Comment < ApplicationRecord

  belongs_to :article, counter_cache: :count_of_comments
  belongs_to :user
end
