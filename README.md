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


# 使用技術(開発環境)
Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code



# アプリ機能
### 1,投稿
画面右上の NewTweet ボタンを押していただくと、投稿フォームが出てきます。
Areaを選択していただき、カメラのアイコンから画像を選んでいただき、
SEND ボタンで投稿ができます。
<img width="1310" alt="投稿フォーム" src="https://user-images.githubusercontent.com/62324184/87266635-af4dba00-c500-11ea-9157-e482a6fea473.png">

### 2,投稿閲覧
画面左上の visitter もしくは、mypageから TripLog を押していただくと
全ユーザーの投稿一覧をご覧いただけます。
また、画面左上の Area ボタンを押すと日本地図のページへ移動します。
そこでエリアを選択していただくと、そのエリアの投稿一覧が表示されます。
<img width="1297" alt="areamap" src="https://user-images.githubusercontent.com/62324184/87266717-e623d000-c500-11ea-82b5-109c8cb784c2.png">

### 3, NextTrip
mypageから NextTrip ボタンを押していただくと、google mapが表示されます。
そこで、気になる名所などを検索していただくと、google mapにピンを立てることができます。
ここで、次回の旅行の計画が立てられます。
<img width="1329" alt=" googlemap " src="https://user-images.githubusercontent.com/62324184/87266876-356a0080-c501-11ea-90c0-182357f7b9d7.png">

### フォロー機能
投稿画像の右下に投稿者のリンクがあり、そこを押していただくと、
そのユーザーの投稿一覧へ行くことができます。
そのページでは、フォローボタンがあるので、そこでユーザーをフォローできます。
(以下、実装予定です。)
また、mypageのTouristからフォロワー一覧へ行くことができます。
そこで、フォローの解除や、フォローしているユーザーの投稿一覧へ移動できます。
![follow](https://user-images.githubusercontent.com/62324184/87266970-68ac8f80-c501-11ea-9514-005178881b30.jpg)

# 工夫したポイント
各エリアごと、各ユーザーごとの投稿を見れるので、投稿表示を見やすくしております。
また、Google map APIを用いて、投稿で見た気になる名所をアプリケーション内で検索していただけるようにしています。


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