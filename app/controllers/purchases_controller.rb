class PurchasesController < ApplicationController
  require 'payjp'
  before_action :set_product
  before_action :set_card, only: [:index, :pay]
  def index
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if @card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    amount: @product.price, 
    customer: @card.customer_id, 
    currency: 'jpy', 
  )
  redirect_to action: 'done' 
  end
  
  def done
    @product.update(status: @product.status += 1)
  end

  private
  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_card
    @card = Card.where(user_id: current_user.id).first
  end

end
