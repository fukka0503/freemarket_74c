class CreateDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_addresses do |t|
      t.string :delivery_family_name,        null: false
      t.string :delivery_first_name,         null: false
      t.string :delivery_family_furigana,    null: false
      t.string :delivery_first_furigana,     null: false
      t.string :postal_code,                 null: false
      t.string :prefecture,                  null: false
      t.string :city,                        null: false
      t.string :street_number,               null: false
      t.string :address_detail
      t.string :phone_number
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end