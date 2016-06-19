Article.all.each do |a|
  if a.headline.include?("Paid Notice:")
    a.hidden = true
    a.save
  end
end