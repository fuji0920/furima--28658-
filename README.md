# README
## usersテーブル

|Column                 |Type  |Options    |
|-----------------------|------|-----------|
|nickname               |string|null: false|
|email                  |string|null: false|
|encrypted_password     |string|null: false|
|last_name              |string|null: false|
|first_name             |string|null: false|
|last_name_kana         |string|null: false|
|first_name_kana        |string|null: false|
|birthday               |date  |null: false|

### Association

has_many :items
has_many :orders

## itemsテーブル

|Column                 |Type   |Options    |
|-----------------------|------|------------|
|name                   |string |null: false|
|text                   |text   |null: false|
|category_id            |integer|null: false|
|product_status_id      |integer|null: false|
|shipping_fee_status_id |integer|null: false|
|shipping_area_id       |integer|null: false|
|shipping_day_id        |integer|null: false|
|price                  |integer|null: false|
|user_id                |integer|foreign_key: true|

### Association

belongs_to :user
has_one :order

## addressテーブル

|Column                 |Type   |Options    |
|-----------------------|-------|-----------|
|post                   |string |null: false|
|prefecture_id          |integer|null: false|
|city                   |string |null: false|
|address                |string |null: false|
|bilding                |string |-------|
|tel                    |string |null: false|
|order_id               |integer|foreign_key: true|

### Association

belongs_to :order

## ordersテーブル

|Column                 |Type   |Options          |
|-----------------------|-------|-----------------|
|item_id                |integer|foreign_key: true|
|user_id                |integer|foreign_key: true|

### Association

belongs_to :user
belongs_to :item
has_one :address