class Article < ActiveRecord::Base
  has_many :article_keywords
  has_many :keywords, :through => :article_keywords

  def print
    puts self.headline
    puts "=> " + self.abstract
    puts "ref: " + self.url
    puts ""
  end
end
