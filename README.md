# README

# アプリケーション名
Visitter


# 概要
自身の旅行の思い出の写真を投稿できます。
アプリケーション使用しているユーザーと思い出を共有できます。
また、google map を用いて次の旅行を計画できます。


# 制作背景
旅行に特化した画像投稿アプリケーションを作ることで、
自身の思い出の記録や他人の投稿から
新たな名所の情報を手に入れられる機会を作ることができると考えております。
また、投稿情報を絞っているので、調べるという旅行計画の楽しさを感じることができます。

# 工夫したポイント
各エリアごと、各ユーザーごとの投稿を見れるので、投稿表示を見やすくしております。
また、Google map APIを用いて、投稿で見た気になる名所をアプリケーション内で検索していただけるようにしています。

# 使用技術(開発環境)
Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code


# これから実装したいこと
ユーザー(フォロワー)、名所などを検索できるようにしたいと考えています。
また、Google mapで検索した物を保存してリストかできるようにしたいと考えています。
さらに、ユーザー登録時、投稿時のバリデーションなどが行えていないので、
そこを修正していきたいと考えています。



# DB設計
<img width="603" alt="visitter" src="https://user-images.githubusercontent.com/62324184/87263985-bfae6680-c4f9-11ea-8c4b-cb1e04269ecd.png">

## Users
|Column|Type|Options|
|------------|------------|------------|
|nickname|string|null: false|
|email|string|null: false|
|enctypted_password|string|null: false|

### Association
- has_many :tweets
- has_many :relationships


## Tweets
|Column|Type|Options|
|------------|------------|------------|
|text|string| |
|image|string| |
|user_id|references|null: false, foreign_key: true|
|area_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :tweet_areas


## Tweet_areas
|Column|Type|Options|
|------------|------------|------------|
|tweet_id|references|null: false, foreign_key: true|
|area_id|references|null: false, foreign_key: true|

### Association
- has_many :tweets
- has_many :areas


## Areas
|Column|Type|Options|
|------------|------------|------------|
|name|string|null: false|

### Association
- has_many :tweet_areas


## relationships
|Column|Type|Options|
|------------|------------|------------|
|follower_id|integer|null: false|
|following_id|integer|null: false|

### Association
- belongs_to :user