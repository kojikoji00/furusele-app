require 'nokogiri'
require 'open-uri'

url  = 'https://www.satofull.jp/'

charset = nil
html = open(url) do |f|
  charset = f.charset # 文字種別を取得
  f.read # htmlを読み込んで変数htmlに渡す
end

doc = Nokogiri::HTML.parse(html, nil, charset)

