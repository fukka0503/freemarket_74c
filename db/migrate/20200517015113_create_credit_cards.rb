class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.integer :number,                     null: false
      t.references :user, foreign_key: true ,null: false
      t.timestamps
    end
  end
end
