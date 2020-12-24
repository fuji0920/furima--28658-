class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @user_order = UserOrder.new
  end

  def new
  end

  def create
    @user_order = UserOrder.new(order_params)
      if @user_order.valid?
         @user_order.save
         redirect_to root_path
      else
        render action: :index
      end
  end

  private
  def order_params
    params.require(:user_order).permit(:post, :shipping_area_id, :city, :address, :bilding, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
