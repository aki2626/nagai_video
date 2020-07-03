# README

## アプリ名

### nagai_video

## 🌐 アプリケーションのURL

##  [https://nagaivideo.herokuapp.com/](https://nagaivideo.herokuapp.com/)
### ただいまデプロイ作業中です。

## 💬 使用方法

`$ git clone https://github.com/aki2626/nagai_video.git`

## 概要

### 動画閲覧
![show](https://user-images.githubusercontent.com/61491759/86476661-e940f280-bd81-11ea-8c6e-b046c3539968.gif)

### 投稿
![video_new](https://user-images.githubusercontent.com/61491759/86476322-425c5680-bd81-11ea-9544-d3cceaf3053e.gif)


### 編集、削除
![video_edit_delete](https://user-images.githubusercontent.com/61491759/86476291-3375a400-bd81-11ea-9ca3-46ebe356f88b.gif)


### コメント投稿
![comment](https://user-images.githubusercontent.com/61491759/86476265-25c01e80-bd81-11ea-9116-fc3550e330bc.gif)

### ウィザード形式によるユーザー登録、編集
### 動画検索（キーワード、タグ）
![search](https://user-images.githubusercontent.com/61491759/86476176-fc06f780-bd80-11ea-8d9e-21b2f4fdde8a.gif)

### 閲覧数によるランキング表示
### マイリスト作成、編集、削除
![mylist](https://user-images.githubusercontent.com/61491759/86476213-0f19c780-bd81-11ea-99dd-9b1194e25311.gif)

## 実装予定の機能

### パンくず機能
### Super Chat機能
### チャンネル開設機能
### 動画投稿時のプレビュー機能

## 実装中の作業

### デプロイ

## :copyright: ライセンス

###  [・ MIT](https://github.com/aki2626/nagai_video/blob/master/LICENSE)

## :eyeglasses:  作成者

### [・ Github](https://github.com/aki2626/)

# DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|address|string|null: false|
|password|string|null: false|

 ### Assosiation

 - has_many :credit_cards
 - has_many :videos
 - has_many :comments
 - has_one  :user_detail

## user_detailsテーブル

|Column|Type|Options|
|------|----|-------|
|gender|integer|null: false|
|prefecture_id|integer|null: false|
|image|string||
|birth_date|date|null: false, use_month_numbers: true|

 ### Assosiation

 - belongs_to :user

 ## credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false,unique: true|
|expiration_month|date|null: false|
|expiration_year|date|null: false|
|card_first_name|string|null: false|
|card_family_name|string|null: false|
|security_code|integer|null: false|
|user_id|reference|null: false, foreign_key: true|

### Association

 - belongs_to : user

 ## videosテーブル
|Column|Type|Options|
|------|----|-------|
|movie|string|null: false|
|title|string|null: false|
|explain|string|null: false|
|genre_id|integer|null: false|
|user_id|reference|null: false, foreign_key: true|

### Association
 - belongs_to :user
 - has_many :comments
 - has_many :videos_tags
 - has_many :tags, through: :videos_tags
 - has_many :mylists, through: :videos_mylists

 ## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
 - has_many :videos_tags
 - has_many :videos, through: :videos_tags

 ## videos_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|video_id|reference|null: false, foreign_key: true|
|tag_id|reference|null: false, foreign_key: true|

### Association
 - belongs_to :video
 - belongs_to :tag

##  commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|user_id|reference|null: false, foreign_key: true|
|video_id|reference|null: false, foreign_key: true|

### Association
 - belongs_to :user
 - belongs_to :video

## mylistsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|explain|string||
|user_id|reference|null: false, foreign_key: true|
 

### Association
 - belongs_to :user
 - has_many   :videos, through: :videos_mylists

## videos_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|video_id|reference|null: false, foreign_key: true|
|tag_id|reference|null: false, foreign_key: true|

### Association
 - belongs_to :video
 - belongs_to :tag
