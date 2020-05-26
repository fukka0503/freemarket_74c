class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :parchases
  has_many :exhibitions
  has_one  :card, dependent: :destroy
  has_one  :delivery_address, dependent: :destroy
  has_many :products, dependent: :destroy


  validates :nickname, presence: true, length: { maximum: 6 }
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龠]/, message: "全角文字のみ" }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龠]/, message: "全角文字のみ" }
  validates :family_furigana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カナのみ" }
  validates :first_furigana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カナのみ" }
  validates :birthday, presence: true
end
