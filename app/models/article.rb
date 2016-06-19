class Article < ActiveRecord::Base
  has_many :article_keywords
  has_many :keywords, :through => :article_keywords

  has_many :lda_group_articles
  has_many :lda_groups, :through => :lda_group_articles
  has_many :lsa_group_articles
  has_many :lsa_groups, :through => :lsa_group_articles

  def print
    puts self.headline
    puts "=> " + self.abstract
    puts "ref: " + self.url
    puts ""
  end

  def similar_articles
    sa = []
    self.lsa_groups.each do |group|
      sa += group.articles
    end
    self.lda_groups.each do |group|
      sa += group.articles
    end
    sa.uniq
  end
end
