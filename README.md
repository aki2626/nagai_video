# README

## アプリ名

## nagai_video

## 🌐 アプリケーションのURL

##  [https://nagaivideo.herokuapp.com/](https://nagaivideo.herokuapp.com/)
#### ただいまデプロイ作業中です。

## 💬 ダウンロード方法

`$ git clone https://github.com/aki2626/nagai_video.git`

## 制作背景

### データ通信量がより増加していく現在、あらゆるWebアプリケーションで文字や画像データだけでなく、動画やライブ映像を取り扱いだすと考えました。<br>そこで、まずは動画データを取り扱ったWebアプリケーションを自力で作れるようになりたいと考え作成しました。

## 本アプリ概要

### 本アプリでは以下の機能を利用できます。
### 動画閲覧,投稿,編集,削除機能<br>コメント投稿機能<br>動画検索（キーワード、タグ）機能<br>マイリスト作成、編集、削除機能<br>ウィザード形式によるユーザー登録、編集機能<br>閲覧数によるランキング表示機能

## 各機能のDEMO
### 動画閲覧機能
![show](https://user-images.githubusercontent.com/61491759/86476661-e940f280-bd81-11ea-8c6e-b046c3539968.gif)

### 動画投稿機能
![video_new](https://user-images.githubusercontent.com/61491759/86476322-425c5680-bd81-11ea-9544-d3cceaf3053e.gif)


### 動画編集、削除機能
![video_edit_delete](https://user-images.githubusercontent.com/61491759/86476291-3375a400-bd81-11ea-9ca3-46ebe356f88b.gif)


### コメント投稿機能
![comment](https://user-images.githubusercontent.com/61491759/86476265-25c01e80-bd81-11ea-9116-fc3550e330bc.gif)

### 動画検索（キーワード、タグ）機能
![search](https://user-images.githubusercontent.com/61491759/86476176-fc06f780-bd80-11ea-8d9e-21b2f4fdde8a.gif)


### マイリスト作成、編集、削除機能
![mylist](https://user-images.githubusercontent.com/61491759/86476213-0f19c780-bd81-11ea-99dd-9b1194e25311.gif)

## 実装中の作業
### デプロイ(本番環境でFFmpegを使用できるように作業中です)

## 工夫したポイント
### ・非ログイン時で使用できる機能に制限をかけた点（動画投稿、編集、削除、マイリスト作成など）
### ・コメント入力機能やマイリスト作成機能を非同期通信で行えるようにして、利用時の快適性を高めることができた。
### ・動画投稿時にFFmpegを利用し動画のサムネイルデータを作成することで、一覧表示の際のデータ量を軽くすることができた。

## 使用技術

### [active_hash(ジャンル情報などの保存のため)](https://github.com/zilkey/active_hash)
### [ffmpeg（動画サムネイル保存などのため）](https://ffmpeg.org/ffmpeg.html)
### [impressionist(視聴履歴確認などのため)](https://github.com/charlotte-ruby/impressionist)
### [act-as-taggable-on(タグ機能実装のため)](https://github.com/mbleigh/acts-as-taggable-on)

## 今後実装したい機能

### Super Chat機能
### チャンネル開設機能
### 動画投稿時のプレビュー機能



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
