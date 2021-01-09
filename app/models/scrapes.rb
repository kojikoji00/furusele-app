# require 'nokogiri'
# require 'open-uri'
# require 'json'

# url  = 'https://www.satofull.jp/'

# # charset = nil
# # html = open(url) do |f|
# #   charset = f.charset # 文字種別を取得
# #   f.read # htmlを読み込んで変数htmlに渡す
# # end

# # 不要な改行、スペースを削除するメソッド
# def text_format(str)
#   str.strip.gsub(/(\r\n|\r|\n|\f)/,"")
# end

# # webページへアクセスし、HTMLをParseした状態で取得するメソッド
# def get_html(url)
#   charset = nil
#   html = open(url) do |f|
#     charset = f.charset # 文字種別を取得
#     f.read # htmlを読み込んで変数htmlに渡す
#   end
#   Nokogiri::HTML.parse(html, nil, charset)
# end

# CATEGORY   = "2039"
# # スクレイピング先のURL:教えてgoo、ベストアンサーありのもの※カテゴリは埋め込み
# PARENT_URL = "https://oshiete.goo.ne.jp/articles/qa/#{CATEGORY}/?sort=2&target=best"
# CHILD_URL  = "//oshiete.goo.ne.jp/qa/"
# # HTMLのパス定義
# TITLE    = '//div[@class="q_article_info clearfix"]/h1'
# QUESTION = '//p[@class="q_text"]'
# ANSWERS  = '//div[@class="a_article clearfix"]'
# ANSWER   = 'div[@class="a_text"]'
# # ページング
# PAGER = '&pg='
# # 取得ページ数(1ページ辺り50件のQA)
# MAX_PAGE = 1
# # proxy設定
# PROXY_SERVER = "http://hoge.jp:8888"
# PROXY_USER   = "user"
# PROXY_PASS   = "password"
# PROXY_SETTING = { proxy_http_basic_authentication: [PROXY_SERVER, PROXY_USER, PROXY_PASS] }

# # ===============================
# #        スクレイピング処理
# # ===============================

# # 結果格納用
# result = []

# # 最大ページ数まで処理を継続
# 1.upto(MAX_PAGE) do |page|
# end
#     # 大元のHTMLをParseした状態で取得
#     doc = get_html(PARENT_URL + PAGER + page.to_s)
#     # 大本のHTMLからのリンク先の一覧を取得
#     urls = doc.xpath('//a').map { |node| node.attribute('href').to_s }
#     # QAページのみを抽出
#     urls = urls.select{ |url| url.include?(CHILD_URL) }.map{ |url| "https:#{url}" }

#     # QAページの一覧から質問、回答、ベストアンサーを取得
#     urls.each do |url|
#         # URLにアクセスし、HTMLをParseして取得
#         doc = get_html(url)
#         # タイトルを取得
#         title = text_format(doc.xpath(TITLE).inner_text)
#         # 質問を取得
#         question = text_format(doc.xpath(QUESTION).inner_text)
#         # 回答部分を一覧で取得
#         all_answers  = doc.xpath(ANSWERS)
#         # ベストアンサーとその他回答用の変数宣言
#         answers = []
#         ba = ""
#         # ベストアンサーとその他を分けて取得
#         all_answers.each do |ans|
#             if ans.to_s.include?("ベストアンサー")
#                 ba = text_format(ans.css(ANSWER).inner_text)
#             else
#                 answers << text_format(ans.css(ANSWER).inner_text)
#             end
#         end
#         # 結果を格納
#         result << {url: url, title: title, question: question, ba: ba, answers: answers}
#     end
# end

# # 結果をJSON形式でファイル保存
# file_name = Date.today.strftime("%Y%m%d") + Time.now.strftime("%H%M%S") + "_result.json"
# file = File.open(file_name, "w")
# file.puts(JSON.generate(result))