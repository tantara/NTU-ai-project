#Article.all.each do |a|
#  a.count = a.keywords.count
#  a.save
#end

Keyword.all.each do |k|
  k.count = k.articles.count
  k.save
end