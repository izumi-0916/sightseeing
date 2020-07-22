# Sightseeing

# 概要
自分のおすすめの場所を投稿したり、口コミを投稿、また各県のおすすめスポットを検索できます。
# 本番環境
停止中

# テストユーザー
email: test@a.a
password: aaaaaa

# 制作背景
どこか旅行に行くとき各県にどのような観光スポットがるのか、実際に行った人の意見をみて、より楽しい旅行になるようにと思いこのアプリを制作しました。

# 工夫したポイント
フラッシュメッセージやホバーアクションを取り入れて視覚的に見やすくしました。
また、お気に入り機能もあるのでお気に入りしたものをいつでも見返せます。

# 使用技術(開発環境)
- Ruby 2.5.1
- Ruby on Rails 5.2.3
- MySQL 5.6.43
- Haml 5.1.2
- Sass 3.7.4
- jQuery 4.3.5
- AWS
  - EC2
  - S3
- Github

# 課題や今後実装したい機能
投稿するときに#海、#山、などを登録して種類ごとに検索できる機能を付けたい

# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, index: true|
### Association
has_many :spot
has_many :comments
has_many :likes
has_many :liked_spots, through: :likes

## spotsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|place|string|null: false|
|text|text|null: false|
|station|string|null: false|
|prefecture_id|bigint|null: false|
|user_id|integer|null: false|
### Association
has_many :images
has_many :comments
has_many :likes
has_many :liked_users, through: :likes
belongs_to :user
belongs_to :prefecture

## prefecturesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
has_many :spots

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|text|text|null: false|
|user_id|integer|null: false|
|spot_id|integer|null: false|
### Association
belongs_to :user
belongs_to :spot

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|src|string|null: false|
|spot_id|bigint||
### Association
belongs_to :spot

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|null: false|
|spot_id|bigint|null: false|
### Association
belongs_to :user
belongs_to :spot





