class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    if user_signed_in?
      @user_order = UserOrder.new
    else
      redirect_to new_user_session_path
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
