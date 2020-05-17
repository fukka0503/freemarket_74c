class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :mail_address,    null: false
      t.string :password,        null: false
      t.string :nickname,        null: false
      t.string :family_name,     null: false
      t.string :first_name,      null: false
      t.string :family_furigana, null: false
      t.string :first_furigana,  null: false
      t.string :birthday,        null: false
      t.timestamps
    end
  end
end
