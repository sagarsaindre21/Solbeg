# Model UserAccessArticle
class UserAccessArticle < ApplicationRecord
  belongs_to :user
  belongs_to :article
end
