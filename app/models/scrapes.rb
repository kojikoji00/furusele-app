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
# sidebox_body
nodes = doc.xpath('//section[@class="Section"]')
node = nodes.xpath('//div[@class="SideBox__body"]')
# category_title = node.css('a')[0].text
# category_link = node.css('a')[0][:href]
category_title = node.css('a').text
category_link = node.css('a')[0][:href]
# node = nodes.xpath('//a')
puts category_title
puts category_link
# nodes.each do |node|
#   title_node = node.xpath('')
#   title = title_node.xpath('a')
#   puts title.text
# end

