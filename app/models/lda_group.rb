class LdaGroup < ActiveRecord::Base
  has_many :lda_group_articles
  has_many :articles, :through => :lda_group_articles
end
