class ProductsController < ApplicationController
  before_action :set_category, only: [:new, :edit, :create, :update, :destroy]
  # before_action :set_item, only: [:show, :edit, :update, :destroy, :purchase, :buy]

  
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
  end

  def edit
  end



  def get_category_children
    @category_children = Category.find(params[:parent_name]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private

  def set_category  
    @category_parent_array = Category.where(ancestry: nil)
  end

  # def item_params
  #   params.require(:prent).permit(
  #     :category_id,
  #     :prent_id
  #     )
  # end
end
