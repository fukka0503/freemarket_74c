class User < ApplicationRecord
  has_many :credit_cards
  has_many :delivery_addresses
  has_many :products
end
