class ProductsController < ApplicationController
  def index
    @product = Product.new
    @products = Product.includes(:images).order(created_at: "DESC").limit(3)
  end

  def new
    @product = Product.new
    @product.images.build
  end

  def create
    @product = Product.new(product_params)
    if @product.save
       redirect_to root_path
    else
      render :new
    end
  end
  
  private
  
  def product_params
    params.require(:product).permit(:name, :price, images_attributes: [:picture])
  end
  

end
