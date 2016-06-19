Article.all.each do |a|
  a.count = 0
  a.lsa_groups.each do |g|
    a.count += g.articles.count
  end
  a.lda_groups.each do |g|
    a.count += g.articles.count
  end
  a.save
end

#Article.all.each do |a|
#  a.count = a.keywords.count
#  a.save
#end
#
#Keyword.all.each do |k|
#  k.count = k.articles.count
#  k.save
#end