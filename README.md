# freemarket_sample_74cのデータベース設計


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|mail_address|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_furigana|string|null: false|
|first_furigana|string|null: false|
|birthday|string|null: false|
### Association
- has_many : parchases
- has_many : exhibitions
- has_many : delivery_addresses
- has_many : cards
- has_many : products

## delivery_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|delivery_name|string|null: false|
|delivery_furigana|string|null: false|
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|street_number|string|null: false|
|address_detail|string||
|phone_number|string||
|user_id|references|null: false, foreign_key: true|
### Association
- has_many : parchases
- belongs_to : user

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|descriptions|string|null: false|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
|status|integer|null: false|
|area|string|null: false|
|fee|string|null: false|
|delivery_time|string|null: false|
|price|string|null: false|
|quality|string|null: false|
|user_id|references|null: false, foreign_key:true|
### Association
- has_many : images
- belongs_to : category
- belongs_to : brand
- belongs_to : user
- has_many : parchases
- has_many : exhibitions


## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|credit_number|string|null: false|
|expiration_date|string|null: false|
|security_code|string|null: false|
### Association
- belongs_to : user

## purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|product|references|null: false, foreign_key: true|
|delivery_address|references|null: false, foreign_key: true|
### Association
- belongs_to : product
- belongs_to : delivery_address

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|picture|string|null: false|
|product_id|references|null: false, foreign_key: true|
### Association
- belongs_to : product

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|
### Association
- has_many : products

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many : products