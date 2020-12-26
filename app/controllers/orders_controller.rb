class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    # 購入者かつ商品がある場合、購入ページに移行する
    # ユーザーかつ商品が売却されている場合、トップページに移行する
    if current_user.id == @item.user_id || @item.order!= nil 
      redirect_to root_path 
    else
      @user_order = UserOrder.new
    end

  end

  def create
    @user_order = UserOrder.new(order_params)
      if @user_order.valid?
        pay_item
         @user_order.save
         redirect_to root_path
      else
        render action: :index
      end
  end

  private
  def order_params
    params.require(:user_order).permit(:post, :shipping_area_id, :city, :address, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price, 
      card: order_params[:token],    
      currency: 'jpy'               
    )
  end
end
