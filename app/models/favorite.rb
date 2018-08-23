class Favorite < ApplicationRecord

   belongs_to :article
   belongs_to :user

   validates :article, uniqueness: {scope: :user}


end
