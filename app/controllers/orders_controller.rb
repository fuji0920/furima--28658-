class OrdersController < ApplicationController
  before_action :set_item, only: [:index]

  def index
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
    params.require(:user_order).permit(:post, :prefecture_id, :city, :address, :bilding, :tel)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
