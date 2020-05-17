class ProductsController < ApplicationController
  def index
    @product = Product.new
    @products = Product.includes(:images).order(created_at: "DESC").limit(3)
  end
end
