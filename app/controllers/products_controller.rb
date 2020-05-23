class ProductsController < ApplicationController
  before_action :set_category, only: [:new, :edit, :create, :update, :destroy]

  
  def index
    @product = Product.new
    @products = Product.includes(:images).order(created_at: "DESC").limit(3)
    @parents = Category.where(ancestry: nil)
  end

  def show
    @product = Product.find(params[:id])
    @parents = Category.where(ancestry: nil)
  end

  def new
    @product = Product.new
    @parents = Category.where(ancestry: nil)
    @brands = Brand.new
    @product.images.build
  end

  def create
    # @images = Image.find(@product.src)
    # @images.save
    @brands = Brand.new(brand_params)
    @brands.save
    @product = Product.new(product_create_params)
    binding.pry
    if @product.save
      redirect_to root_path
    else
      redirect_to new_product_path
    end
  end

  def edit
    @product = Product.find(params[:id])
    @brands = Brand.find(@product.brand_id)
    @categories = Category.where(params[:root_id])
    grandchild_category = @product.category
    child_category = grandchild_category.parent
    @category_children = Category.where(ancestry: child_category.ancestry)
    parent_category = child_category.parent
    @category_parent = Category.where(ancestry: parent_category.ancestry)
    grandchild_category = @product.category
    @category_grandchildren = Category.where(ancestry: grandchild_category.ancestry)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path
  end



  def get_category_children
    @category_children = Category.find(params[:parent_name]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  
  def set_category  
    @category_parent_array = Category.roots
  end

  private
  def product_create_params
    params.require(:product).permit(:name,:descripitons,:size,:category_id,:quality,:area,:fee,:delivery_time,:price,images_attributes: [:picture]).merge(user_id:current_user.id,brand_id:@brands.id,status:0)
  end

  def brand_params
    params.require(:brand).permit(:name)
  end

end
