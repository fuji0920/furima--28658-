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
|Column             |Type   |Options|
|id                 |BIGINT |-------|
|nickname           |VARCHAR|null: false|
|email              |VARCHAR|foreign_key: true|
|pw                 |VARCHAR|foreign_key: true|
|confirmation_pw    |VARCHAR|foreign_key: true|
|last_name          |VARCHAR|null: false|
|first_name         |VARCHAR|null: false|
|last_name_kana     |VARCHAR|null: false|
|last_name_kana     |VARCHAR|null: false|
|birthday           |date   |null: false|
### Association
has_many :products
has_many :purchase_records

## productsテーブル
|Column             |Type   |Options|
|id                 |BIGINT |-------|
|name               |VARCHAR|null: false|
|image              |string |null: false|
|text               |text   |null: false|
|category           |integer|null: false|
|product_status     |integer|null: false|
|shipping_fee_status|integer|null: false|
|shipping_area      |integer|null: false|
|shipping_days      |integer|null: false|
|price              |integer|null: false|
|users_id           |BIGINT |-------|
### Association
belongs_to :users
has_one :purchase_records

## addressテーブル
|Column             |Type   |Options|
|id                 |BIGINT |-------|
|post               |string |null: false|
|prefecture         |integer|null: false|
|city               |integer|null: false|
|address            |integer|null: false|
|bilding            |integer|-------|
|tel                |integer|null: false|
|purchase_records_id|BIGINT |null: false|
### Association
belongs_to :purchase_records

## purchase_recordsテーブル
|Column             |Type   |Options|
|id                 |BIGINT |-------|
|products_id        |BIGINT |-------|
|users_id           |BIGINT |-------|
### Association
belongs_to :users
belongs_to :products
has_one :address