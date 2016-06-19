LsaGroup.all.each do |g|
  if g.articles.count >= 3
    puts " =================== LSAGroup#{g.id} ==================="
    g.articles.each do |a|
      a.print
    end
  else
    g.hidden = true
    g.save
  end
end