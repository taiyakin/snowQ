# snowQ
https://snow9taiyaki.herokuapp.com/
[![Image from Gyazo](https://i.gyazo.com/a43473372a532e3df0cc290ca5391864.png)](https://gyazo.com/a43473372a532e3df0cc290ca5391864)

スノーボード技術に関する質問ができるアプリです。
スノーボードのジャンルごとに分けて細かく質問することができます。

- 初心者だけど周りに教えてくれる経験者がいなくてハードルが高い
- 専門的な用語が多く初心者には理解が難しい
- 上手くなるためにどんな練習をすればいいのかわからない
- やりたい技がなかなか覚えられない
- 自分の滑りを見て客観的にアドバイスして欲しい

そんな人に向けた質問投稿アプリです。


## 概要
- 質問したいジャンルを選択して投稿、写真や動画も一緒に投稿できる
- 投稿された質問一覧はトップページに、サイドバーからジャンルごとに表示できる
- 投稿された質問をクリックすると詳細が見れる。そこから質問に対する回答が可能
- 回答する際も画像、動画が投稿可能
- 回答に対していいねが付けられる
- インクリメンタルサーチ

質問者テストアカウント
email: test@test
Pass : aaaaaaaa

回答者テストアカウント
email: answer@test
Pass : aaaaaaaa

## 制作の経緯
愛するスノーボードをもっと盛り上げたい！という思いからこのアプリを制作いたしました。<br>
スノーボードは非常に楽しいスポーツですが、スキー場までの距離やかかる費用など始めるには心理的ハードルが高いスポーツです。

またメジャースポーツに比べ競技人口が少ないせいか、上達のための有益な情報がまとまっていないと感じました。<br>
あまりにも楽しいスポーツなので滑るのに夢中で人に教える暇なんかねえ！て感じです。みんな一心不乱に滑り続けています。

実際、数年前に私がスノーボードを始めた当初は身近に教えてくれる人もおらず、自分がやっていることが正しいのかわからず苦労した経験があります。<br>
それでも上手くなりたい一心で独学で上達できましたが、ほとんどの人は転倒の痛みだけを記憶し、楽しさを知る前にやめてしまいます。

そんな時すぐ質問し交流できる環境があれば初心者も挫折せず上達でき、競技人口が増え盛り上がるのでは？と考えました。<br>
近年の温暖化、コロナ自粛によって多くのスキー場が危機的状況に瀕しております！
ここから生まれる交流によってスノーボードを愛する人が増えること、その一助になることを願います！

## DEMO
[![Image from Gyazo](https://i.gyazo.com/6423beb275236f662acb7b7fb5f31fa4.gif)](https://gyazo.com/6423beb275236f662acb7b7fb5f31fa4)

[![Image from Gyazo](https://i.gyazo.com/bb68f586b5288c5b2898dce6389abcc0.gif)](https://gyazo.com/bb68f586b5288c5b2898dce6389abcc0)


## 工夫したポイント
- 質問を非同期で検索（タイトルoテキスト）
[![Image from Gyazo](https://i.gyazo.com/8b15a281a8090a3857ff8fe067a3b5fc.gif)](https://gyazo.com/8b15a281a8090a3857ff8fe067a3b5fc)

- ページネーション機能実装 一度に表示できるのは20件まで
[![Image from Gyazo](https://i.gyazo.com/05ca7b03f5d17415571e3cfb336143da.gif)](https://gyazo.com/05ca7b03f5d17415571e3cfb336143da)

- 投稿をカテゴリごとに分類することで見やすく表示
[![Image from Gyazo](https://i.gyazo.com/50fd7e08b4c490e9cacc70de66b4b2c3.gif)](https://gyazo.com/50fd7e08b4c490e9cacc70de66b4b2c3)

- 質問、回答どちらにも画像、動画を添付可能にして説明を伝えやすく
[![Image from Gyazo](https://i.gyazo.com/7b95aa7a2358c7579843b43e3d6351a0.gif)](https://gyazo.com/7b95aa7a2358c7579843b43e3d6351a0)


- ユーザーの名前や「自分の投稿」クリックするとそのユーザーの質問一覧が表示される
[![Image from Gyazo](https://i.gyazo.com/6a7d87b2cdad0ecda6f779416f2a5d85.gif)](https://gyazo.com/6a7d87b2cdad0ecda6f779416f2a5d85)

- 非同期でいいね機能を実装
[![Image from Gyazo](https://i.gyazo.com/f97519d99c3d579d94d0e24d2061e6b4.gif)](https://gyazo.com/f97519d99c3d579d94d0e24d2061e6b4)

- 本番環境では動画や画像はS3に保存される


## 使用技術（開発環境）
Ruby 2.5.1<br>
Rails 5.2.3<br>
Rspec<br>
HAML<br>
SCSS<br>
AWS(S3)<br>
heroku<br>


## 課題や今後実装したい機能
- アンサーの投稿の非同期通信
- いいねの数が多い順に表示
- タグ付けによって検索機能を向上
- SNSアカウントを紐付ける
- youtubeを埋め込み再生機能



## DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_many :answers
- has_many :questions
- has_many :likes

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|genre|string|null: false|

### Association
- has_many :questions

## questionsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false||
|text|text|null: false||
|video|string||
|image|string||
|user_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|

### Association
- has_many :answers
- belongs_to : user
- belongs_to :category

## answersテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|video|string||
|image|string||
|question_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :question
- belongs_to :user
- has_many :likes


## likesテーブル
|Column|Type|Options|
|------|----|-------|
|answer_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

- belongs_to :answer
- belongs_to :user
