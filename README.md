私が作成したふるさと納税支援アプリ「ふるセレ」についてご紹介させていただきます。

アプリ名：「ふるセレ」https://furusele-app.herokuapp.com/

■トップ画面
f:id:kotakota8448:20210303124458p:plain


■ER図
f:id:kotakota8448:20210303124305p:plain

 
■使用技術
▼フロントエンド
・HTML(HAML)・CSS（SCSS）・JavaScript（jQuery）
▼サーバーサイド
・Ruby 2.6.6・Ruby on Rails 6.0.3.4
▼インフラ・開発環境
・PostgreSQL 13.1・heroku・Rubocop・RSpec

 

■使用Gem
annotate/aws-sdk-s3/better_errors/binding_of_caller/devise/faker/activerecord-import/nokogiri/gon/google-analytics-rails/byebug/dotenv-rails/factory_bot_rails/pry-byebug/rails-erd/rspec-rails/rubocop-rails/erb2haml/capybara

 

■メインキャラクターについて
f:id:kotakota8448:20210303121503p:plain
ココナラで外注しています。親しみやすいキャラクターにしました。
今回は「フタバ」さんに依頼しました。
 

■主な機能
・ログイン機能
・ゲストログイン機能
・年収・家族構成によって控除限度額を算出（DBから表示）
・カテゴリーを選択（3つまで、メインカテゴリー・サブカテゴリーから選択）
・選択したカテゴリーを条件にさとふるのランキング上位から5つをスクレイピングにより表示。
・過去の選択した商品をマイページから確認できる。
・お問い合わせページ
・プライバシーポリシー・利用規約
 
■アプリの作成について
＜作成方針＞
・技術をたくさん盛り込むよりも、まずはきちんと使えるサイトを作る。
・楽天やさとふるは商品を探す上でとても役立つサイトですが、商品の選択肢が多く、その分何を選べば良いかわからなくなることがあるため、わかりやすさとシンプルさを重視して差別化を図る。

＜ターゲット＞
・初めてふるさと納税をする人・時間がない人
・支援する地域にこだわりがない人


■ワイヤーフレームとサイトマップ（一部抜粋）
f:id:kotakota8448:20210312072714p:plain
f:id:kotakota8448:20210312072751p:plain
f:id:kotakota8448:20210312072822p:plain

 
 ■実際の操作画面
年収・家族構成登録（控除額算出）
f:id:kotakota8448:20210303233358p:plain

カテゴリー選択
f:id:kotakota8448:20210303231418p:plain

 

商品表示画面（例）
・スクレイピングによる商品情報表示（nokogiriを利用。さとふるから情報取得）

　上：魚介・海産物、米・パンで検索　
　下：果物・米・パンで検索
f:id:kotakota8448:20210303230822p:plain

 

■アプリの改善項目
＜機能面＞
Githubのissueにて管理をしているので、適宜更新していきます。 
・カテゴリー選択後にスクレイピングが毎度走るので時間がかかる
　→　ユーザーの離脱リスク を減らす

・ログインしていないユーザーでも機能を一部使えるよう修正
　→　会員登録への誘導 
 
・セレクトボックス のレイアウトの修正
　→　初めてのユーザーが見てどのようなカテゴリーがあるかがわかり辛い
　　 写真でカテゴリー一覧を見せるなど工夫が必要

・控除額の算出ロジックの修正
　→　現在はDBからおおよその金額を算出しているのみで正確な数字ではない。
　　 ただし所得税や住宅借入金などを考慮し、ユーザーにも項目入力の手間をかけてしまうことから今回は実装を見送っている。

・商品表示のロジック修正
　→　選択した商品カテゴリーの選択される比率の修正。
　　 現在はカテゴリーを選択した状態をスクレイピング先のURLとして指定。
　　 共通のランキングから上位5つを持ってくるロジック。
　　 ただそれだと場合によって選ばれないカテゴリーが出てきてしまう。
　　 同じ比率で選ばれるよう設定する必要がある

・スクレイピングする対象を増やす。
　→　①さとふるだけでなく楽天等からも取得できるように。
　　 ②還元率や地域別などからも情報を取れるように

 

＜コード面＞
・テスト項目を増やす　
　　→　現時点では手動テストを実施。機能面追加時には必要となる。
・自動テストの実装
　　→　機能的に現状は不要と判断した。
・可読性の向上
　　→　コントローラーが肥大化している
・保守性の向上

 

アプリについての紹介は以上です。
ぜひよろしければ一度お試しください！ 
ご意見がありましたらぜひ問い合わせページよりお願いいたします。
