class HomesController < ApplicationController
  def index
    require 'anemone'
    require 'nokogiri'
    require 'kconv'

    url = []
    url.push("https://www.kinokuniya.co.jp/disp/CKnRankingPageCTop.jsp?vTp=w")
    
    Anemone.crawl(url, depth_limit: 0) do |anemone|
      anemone.on_every_page do |page|

        doc = Nokogiri::HTML.parse(page.body.toutf8)

        @books = []
        5.times do |num|
          book = {}
          num = num + 1
          ranking_path_title = "/html/body/div[1]/div[3]/div[2]/div[4]/ol/li[" + num.to_s + "]/p[2]/a"
          title = doc.xpath(ranking_path_title).text
    
          ranking_path_photo = "/html/body/div[1]/div[3]/div[2]/div[4]/ol/li[" + num.to_s + "]/p[1]/a/img"
          photo = doc.xpath(ranking_path_photo).css("img")[0][:src]
          photo.slice!(0,2)
          photo_url = "https://www.kinokuniya.co.jp/" + photo

          ranking_path_id = "/html/body/div[1]/div[3]/div[2]/div[4]/ol/li[" + num.to_s + "]/p[1]/a"
          idurl = doc.xpath(ranking_path_id).css("a")[0][:href]

          book[:title] = title
          book[:photo_url] = photo_url
          book[:rank] = num
          book[:url] = idurl
          @books << book
        end
      end
    end

    url_m = []
    url_m.push("https://www.kinokuniya.co.jp/disp/CKnRankingPageCTop.jsp?vTp=m")
    Anemone.crawl(url_m, depth_limit: 0) do |anemone|
      anemone.on_every_page do |page|

        doc = Nokogiri::HTML.parse(page.body.toutf8)

        @books_m = []
        5.times do |num|
          book = {}
          num = num + 1
          ranking_path_title = "/html/body/div[1]/div[3]/div[2]/div[4]/ol/li[" + num.to_s + "]/p[2]/a"
          title = doc.xpath(ranking_path_title).text
    
          ranking_path_photo = "/html/body/div[1]/div[3]/div[2]/div[4]/ol/li[" + num.to_s + "]/p[1]/a/img"
          photo = doc.xpath(ranking_path_photo).css("img")[0][:src]
          photo.slice!(0,2)
          photo_url = "https://www.kinokuniya.co.jp/" + photo
          
          book[:title] = title
          book[:photo_url] = photo_url
          book[:rank] = num
          @books_m << book
        end
        
      end
    end

    @date = DateTime.now
  end  
end
