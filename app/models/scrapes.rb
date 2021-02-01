require 'nokogiri'
require 'open-uri'
require 'json'

url  = 'https://www.satofull.jp/products/list.php?cnt=60&p=1'

charset = nil
html = open(url) do |f|
  charset = f.charset
  f.read
end


doc = Nokogiri::HTML.parse(html, nil, charset)

# nodes = doc.xpath('//section[@class="Section"]')
# nodes = doc.xpath('//ul[@class="ItemList"]')
nodes = doc.xpath('//ul[@class="ItemList"]')
# node = nodes.xpath('//div[@class="ItemList__body"]')
node = nodes.css('li')

node.each do |category|
  category_link = category.css('a').attribute('href')
  category_title = category.xpath('//p[@class="ItemList__name"]').inner_text
  category_city = category.xpath('//p[@class="ItemList__city"]').inner_text
  category_price = category.xpath('//p[@class="ItemList__price"]').inner_text
  # category_review = category.xpath('//p[@class="ItemList__review"]')
  puts category_title
  puts category_city
  puts category_price
  puts category_link
  # puts category_review
end


