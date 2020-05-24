class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :brand, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images

  validates :images, presence: true

  validates :name, presence: true,length: { maximum: 50}
  validates :descriptions, presence: true, length: { maximum: 1000}
  validates :status, presence: true
  validates :area, presence: true
  validates :fee, presence: true
  validates :delivery_time, presence: true
  validates :price, presence: true, inclusion: 300..9999999
end


