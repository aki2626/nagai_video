# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## 🌐 App URL

### 本番環境にアップ後入力する

## 💬 Usage

`$ git clone https://github.com/aki2626/nagai_video.git`

## 概要

### 動画投稿、編集、削除
### 動画閲覧
### コメント投稿
### ウィザード形式によるユーザー登録、編集
### 動画検索（キーワード、タグ）
### 閲覧数によるランキング表示
### マイリスト作成、編集、削除

## 実装予定の機能

### パンくず機能
### Super Chat機能
### チャンネル開設機能
### 動画投稿時のプレビュー機能

## :copyright: License

###  [・　MIT](https://github.com/aki2626/nagai_video/blob/master/LICENSE)

## :eyeglasses:  Author

### [・　Github](https://github.com/aki2626/)

# DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|address|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|photo_number|integer|null: false|
|year_birth_at|date|null: false|
|month_birth_at|date|null :false|
|day_birth_at|date|null: false|

 ### Assosiation

 - has_many :credit_cards
 - has_many :videos
 - has_many :comments

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
|video|string|null: false, unique: true|
|title|string|null: false|
|explain|string||
|user_id|reference|null: false, foreign_key: true|

### Association
 - belongs_to :user
 - has_many :comments
 - has_many :videos_tags
 - has_many :tags, through: :videos_tags

 ## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null: false, unique: true|

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
 
 