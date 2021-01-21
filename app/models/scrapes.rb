require 'nokogiri'
require 'open-uri'
require 'json'

url  = 'https://www.satofull.jp/'

charset = nil
html = open(url) do |f|
  charset = f.charset
  f.read
end


doc = Nokogiri::HTML.parse(html, nil, charset)

nodes = doc.xpath('//section[@class="Section"]')
node = nodes.xpath('//div[@class="SideBox__body"]')

node.each do |category|
  category_title = category.css('a').text
  category_link = category.css('a[href]')
  puts category_title
  puts category_link
end


