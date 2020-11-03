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
|Column                 |Type   |Options|
|nickname               |string|null: false|
|email                  |string|foreign_key: true|
|encrypted_password     |string|foreign_key: true|
|last_name              |string|null: false|
|first_name             |string|null: false|
|last_name_kana         |string|null: false|
|last_name_kana         |string|null: false|
|birthday               |date  |null: false|
### Association
has_many :products
has_many :purchase_records

## productsテーブル
|Column                 |Type   |Options|
|name                   |string |null: false|
|text                   |text   |null: false|
|category_id            |integer|null: false|
|product_status_id      |integer|null: false|
|shipping_fee_status_id |integer|null: false|
|shipping_area_id       |integer|null: false|
|shipping_days_id       |integer|null: false|
|price                  |integer|null: false|
|users_id               |integer|foreign_key: true|
### Association
belongs_to :user
has_one :purchase_record

## addressテーブル
|Column                 |Type   |Options|
|post                   |string |null: false|
|prefecture_id          |integer|null: false|
|city                   |integer|null: false|
|address                |string |null: false|
|bilding                |string |-------|
|tel                    |string |null: false|
|purchase_records_id    |integer|foreign_key: true|
### Association
belongs_to :purchase_record

## purchase_recordsテーブル
|Column                 |Type   |Options|
|product_id             |integer|foreign_key: true|
|user_id                |integer|foreign_key: true|
### Association
belongs_to :user
belongs_to :product
has_one :address