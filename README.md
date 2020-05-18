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
- has_many : credit_cards
- has_many : products
- has_many : dealings

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
- has_many : dealings
- belongs_to : user

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|descripitons|text|null: false|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
|status|string|null: false|
|area|string|null: false|
|fee|string|null: false|
|delivery_time|date|null: false|
|price|string|null: false|
|user_id|references|null: false, foreign_key:true|
### Association
- has_many : images
- belongs_to : category
- belongs_to : brand
- belongs_to : users
- has_many : parchases
- has_many : exhibitions
- belongs_to : dealing

## dealingsテーブル
|Column|Type|Options|
|------|----|-------|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|
|products_id|references|null: false, foreign_key: true|
|delivery_address_id|references|null: false, foreign_key: true|
### Association
- belongs_to : users
- belongs_to : addresses
- belings_to : products


## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|credit_number|string|null: false|
|expiration_date|string|null: false|
|security_code|string|null: false|
### Association
- belongs_to : user

## purchaseテーブル
|Column|Type|Options|
|------|----|-------|
|product|references|null: false, foreign_key: true|
|delivery_address_id|references|null: false, foreign_key: true|
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