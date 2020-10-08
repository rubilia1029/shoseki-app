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

# アプリケーション名
書籍アプリ

# アプリケーション概要
このアプリケーションでは様々な本の情報を得られることができ、また読んだ本の書評などを書き込むことができる。

# URL

# テスト用アカウント
mail:aiai@yahoo.co.jp
pass:maeta1029

# 利用方法
ログインして興味がある本を一覧から探し書評を読む。また、ない場合は自分で作り投稿を集める。

# 目指した問題解決
コロナ禍において本の売り上げが急増した。本に興味を持った方々が今の自分に合う本を見つけられる手助けができるようにしたかった。また、本の良さを表せられるような場所を提供したかった。

# 要件
機能	目的	詳細
ユーザー管理機能	ログインする必要があるから	devise
本ランキング機能	週間・月間のランキングを表示するため	スクレイピング
本・投稿機能	本のレビューの元にするため	画像・著者・タイトル記載
本・一覧機能	本の一覧を表示するため	book.index
本・詳細機能	本の詳細を知るため	
本・コメント機能	本のレビューを書くため	ユーザーとニックネームを記載
マイページ機能	自分や他人がどういうレビューをしているか見るため	他人のマイページにも飛べるようにする
ユーザーお気に入り機能	気になるユーザーをお気に入りにいれる	お気に入りボックス作る？
本・評価機能	その本の評価を知るため	
商品検索	本を見つけられるようにするため	
SNS認証	SNSアカウントでログイン	
AWS	S3保存	

# テーブル設計

## users テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| nickname  | string | null: false |
| email     | string | null: false |
| password  | string | null: false |


### Association

- has_many :comments
- has_many :books




## books テーブル

| Column  | Type   | Options     |
| ------  | ------ | ----------- |
| name    | string | null: false |
| author  | text   | null: false |
|category | integer| null: false |
| user_id | integer| null: false |

### Association

- belongs_to :user

## comments テーブル
| Column  | Type   | Options     |
| ------  | ------ | ----------- |
| books_id| integer| null: false |
| user_id | integer| null: false |

- belongs_to :books
- belongs_to :user
