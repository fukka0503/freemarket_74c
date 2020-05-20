class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :product
  mount_uploader :product_image, ImageUploader

end
