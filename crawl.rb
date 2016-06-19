require 'net/http'
require 'json'


def crawl(end_date, key, q = "sex", last_page = 10)
  # Built by LucyBot. www.lucybot.com
  uri = URI("https://api.nytimes.com/svc/search/v2/articlesearch.json")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true

  0.upto(last_page) do |page|
    uri.query = URI.encode_www_form({
      "api-key" => key,
      "q" => q,
      "end_date" => end_date,
      #"sort" => "newest",
      "fl" => "headline,keywords,pub_date,web_url,_id,snippet,section_name,multimedia",
      "page" => page
    })
    request = Net::HTTP::Get.new(uri.request_uri)
    result = JSON.parse(http.request(request).body)
    #puts result.inspect

    result["response"]["docs"].each do |doc|
      nid = doc["_id"]
      headline = doc["headline"]["main"]
      #abstract = doc["abstract"]
      abstract = doc["snippet"]
      published_at = doc["pub_date"].to_time
      url = doc["web_url"]
      keywords = doc["keywords"] # rank, value

      section = (doc["section_name"] || "").downcase
      reporter = ""#doc["byline"].downcase
      media = doc["multimedia"].to_s

      #article = Article.find_by(:nid => nid) || Article.create(:nid => nid, :headline => headline, :published_at => published_at, :url => url)
      article = Article.find_by(:nid => nid) || Article.create(:nid => nid, :headline => headline, :published_at => published_at, :url => url, :section => section, :reporter => reporter, :media => media, :abstract => abstract)
      keywords.each do |k|
        keyword = Keyword.find_by(:name => k["value"]) || Keyword.create(:name => k["value"])
        ArticleKeyword.create(:article_id => article.id, :keyword_id => keyword.id)
      end
    end
  end
end

keys = [
  "1a6bfe5549254c4e8a47a45925e730f4",
  "02ecbe6cb9d6408784135967f1b95a88", #tantara.tm
  "3b50dc62f92d47be9c8c8fd9749410eb", #tantara.tm+ny2
  "cac923e1992d4609a3bc2b8ba4627f4d", #tantara.tm+ny3
  "b44b8d0833174d6ea0a5ff0b6354c90b", #tantara.tm+ny4
  "194aaf8445eb4424a1825676c036df0a", #tantara.tm+ny5
  "0cfb27fa6f774b3483ee4862e2c79284", #tantara.tm+ny6
  "5cd49732da8149bb95448d623f60c3d8", #tantara.tm+ny8
  "2081876d0c0a46e1a1d7e45793abd083", #tantara.tm+ny9
]

today = Time.now
#today = Time.new(2012, 6, 24)
#today = Time.new(2016, 1, 15)
#today = Time.new(2015, 8, 2)
#today = Time.new(2015, 2, 17)
#today = Time.new(2014, 9, 4)
#today = Time.new(2014, 3, 22)
#today = Time.new(2013, 10, 7)
#today = Time.new(2013, 4, 24)
#today = Time.new(2012, 11, 9)
diff = 0
keys.each do |key|
  begin
    while true
      day = today - diff.days

      s = Time.now
      #crawl(day.strftime("%Y%m%d"), key, "", 3)
      crawl(day.strftime("%Y%m%d"), key, "", 10)
      e = Time.now


      puts day.to_s
      #puts "Start: #{s.to_s}, End: #{e.to_s}"
      #puts "Total: #{(e - s).to_i}secs"

      diff += 1
    end
  rescue
    puts "=> #{key} is restricted"
  end
end
