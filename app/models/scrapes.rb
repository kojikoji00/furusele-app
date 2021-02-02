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
nodes = doc.xpath('//ul[@class="ItemList"]')

array = []
f = []

nodes.css('a').first(10).each do |node|
  link = 'https://www.satofull.jp' + node[:href]
  name = node.css('.ItemList__name').text
  city = node.css('.ItemList__city').text
  price = node.css('.ItemList__price').text
  review = node.css('img').attribute('src')
  array << [link, name, city, price, review]
end

array.shuffle.each do |t|
   f << t
end

# メモ
# if x = 1つだったら
#   number = 5
# elsif x = 2つだったら
#   number = 4
# elsif x = 3つだったら
#   number = 3
# elsif x = 4つだったら
#   number = 2
# elsif x = 5つだったら
#   number = 1
# end

puts  f.first(5).inspect



