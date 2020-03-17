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

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, index: true|
### Association
has_many :spot
has_many :comments
has_many :likes

## spotsテーブル
|Column|Type|Options|
|------|----|-------|
|prefecture|string|null: false|
|name|string|null: false|
|place|string|null: false|
|text|text|null: false|
|station|string|null: false|
|user_id|integer|null: false|
### Association
has_many :images
has_many :comments
has_many :likes
belongs_to :user

## comments table
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|spot_id|integer|null: false, foreign_key: true|
### Association
belongs_to :user
belongs_to :spot

## images table
|Column|Type|Options|
|------|----|-------|
|src|string|null: false|
|item_id|bigint||
### Association
belongs_to :spot

## likes table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|spot_id|integer|null: false|
### Association
belongs_to :user
belongs_to :spot





