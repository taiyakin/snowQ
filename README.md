# README

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
|genre|string|null: false, foreign_key: true|

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