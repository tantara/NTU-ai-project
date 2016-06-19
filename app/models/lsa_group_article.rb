class LsaGroupArticle < ActiveRecord::Base
  belongs_to :article
  belongs_to :lsa_group
end
