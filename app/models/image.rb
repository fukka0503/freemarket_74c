class Image < ApplicationRecord
  belongs_to :product
  mount_uploader :product_image, ImageUploader

end
