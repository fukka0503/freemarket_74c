class DeliveryAddress < ApplicationRecord
  belongs_to :user

  validates :delivery_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龠]/, message: "全角文字のみ" }
  validates :delivery_furigana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カナのみ" }
  validates :postal_code, presence: true, format:  {with: /\A\d{7}\Z/, message:"ハイフンなしで７桁の数字を入力してください"}
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :street_number, presence: true
  validates :phone_number, format:  {with: /\A[0-9]+\Z/, message:"電話番号は10桁か11桁で入力してください"}

end
