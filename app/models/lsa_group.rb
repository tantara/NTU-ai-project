class LsaGroup < ActiveRecord::Base
  has_many :lsa_group_articles
  has_many :articles, :through => :lsa_group_articles
end
