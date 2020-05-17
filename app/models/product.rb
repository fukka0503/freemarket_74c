class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  belongs_to :status
  belongs_to :category
  belongs_to :delivery_address
  belongs_to :brand
  has_many :images, dependent: :destroy
end
