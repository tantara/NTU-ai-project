class LdaGroupArticle < ActiveRecord::Base
  belongs_to :article
  belongs_to :lda_group
end
