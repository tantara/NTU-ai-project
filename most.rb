require 'net/http'
require 'json'

def crawl(key, period, last_page = 100)
  #uri = URI("https://api.nytimes.com/svc/mostpopular/v2/mostviewed/technology,science,sports,movies,world/#{period}.json")
  uri = URI("https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/#{period}.json")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true

  #4.upto(last_page) do |page|
  5.upto(last_page) do |page|
    uri.query = URI.encode_www_form({
      "api-key" => key,
      "offset" => 20 * page,
    })
    request = Net::HTTP::Get.new(uri.request_uri)
    result = JSON.parse(http.request(request).body)

    result["results"].each do |doc|
      nid = doc["url"]
      headline = doc["title"]
      abstract = doc["abstract"]
      published_at = doc["published_date"].to_time
      url = doc["url"]

      section = doc["section"].downcase
      reporter = doc["byline"].downcase
      media = doc["media"].to_s

      article = Article.find_by(:nid => nid) || Article.create(:nid => nid, :headline => headline, :published_at => published_at, :url => url, :section => section, :reporter => reporter, :media => media, :abstract => abstract)
    end

    puts 20 * (page + 1)
    puts result["num_results"]
    if 20 * (page + 1) > result["num_results"]
      break
    end
    sleep(1)
  end
end

keys = [
  "d612fe3324ea43f8879367fd424beed1", #tantara.tm
]

period = 30
keys.each do |key|
  begin
    while true
      s = Time.now
      crawl(key, period)
      e = Time.now

      puts "period #{period}"
      period += 1
    end
  rescue
    puts "=> #{key} is restricted"
  end
end