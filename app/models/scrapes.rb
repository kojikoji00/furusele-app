require 'nokogiri'
require 'open-uri'
require 'json'

# メモ　カテゴリーの選択に応じて抽出するアドレスを選択する
# history→category_id→satofull_id
# url  = 'https://www.satofull.jp/products/list.php?cat={satofull_id}'
url  = 'https://www.satofull.jp/products/list.php?'

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
  price = node.css('.ItemList__price>span').text.delete(',').to_i
  description = node.css('.ItemList__description').text
  picture = 'https://www.satofull.jp' + node.css('.ItemList__picture>img').attribute('src')
  review = 'https://www.satofull.jp' + node.css('.ItemList__review>img').attribute('src')
  array << [link, name, city, price,description, picture, review]
end

array.shuffle.each do |t|
  f << t
end

# メモ カテゴリーの選択数に応じて分岐させたい
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

# puts  f.first(5).inspect
puts  f.first(5)



