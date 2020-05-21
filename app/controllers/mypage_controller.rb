class MypageController < ApplicationController

  def index
    @parents = Category.where(ancestry: nil)
  end

  def new
    @parents = Category.where(ancestry: nil)
  end

  def show
    @parents = Category.where(ancestry: nil)
  end

end
