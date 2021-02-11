
# def item_list
#   require 'nokogiri'
#   require 'open-uri'
#   require 'json'
#   # メモカテゴリーの選択に応じて抽出するアドレスを選択する
#   # history→category_id→satofull_id
#   # url  = 'https://www.satofull.jp/products/list.php?cat={satofull_id}'
#   url = 'https://www.satofull.jp/products/list.php?'
#   charset = nil
#   html = open(url) do |f|
#     charset = f.charset
#     f.read
#   end

#   doc = Nokogiri::HTML.parse(html, nil, charset)
#   nodes = doc.xpath('//ul[@class="ItemList"]')

#   array = []
#   lists = []

#   nodes.css('a').first(10).each do |node|
#     link = 'https://www.satofull.jp' + node[:href],
#     name = node.css('.ItemList__name').text,
#     city = node.css('.ItemList__city').text,
#     price = node.css('.ItemList__price>span').text.delete(',').to_i,
#     description = node.css('.ItemList__description').text,
#     picture_image_path = 'https://www.satofull.jp' + node.css('.ItemList__picture>img').attribute('src'),
#     review_image_path = 'https://www.satofull.jp' + node.css('.ItemList__review>img').attribute('src'),
#     array << [link, name, city, price,description, picture_image_path, review_image_path]
#     array.shuffle.each do |t|
#       lists << t
#       lists.each do |list|
#         item = CategoryDetail.new
#         item.link = link
#         item.name = name
#         item.city = city
#         item.price = price
#         item.description =  description
#         item.picture_image_path = picture_image_path
#         item.review_image_path = review_image_path
#         item.save
#       end
#     end
#   end
# end
# nodes.css('a').first(10).each do |node|
#   link = 'https://www.satofull.jp' + node[:href],
#   name = node.css('.ItemList__name').text,
#   city = node.css('.ItemList__city').text,
#   price = node.css('.ItemList__price>span').text.delete(',').to_i,
#   description = node.css('.ItemList__description').text,
#   picture_image_path = 'https://www.satofull.jp' + node.css('.ItemList__picture>img').attribute('src'),
#   review_image_path = 'https://www.satofull.jp' + node.css('.ItemList__review>img').attribute('src'),
#   array << [link, name, city, price,description, picture_image_path, review_image_path]
#   array.shuffle.each do |t|
#     f << t
#   end
# end

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


