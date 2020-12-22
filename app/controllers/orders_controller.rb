class OrdersController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user_order = UserOrder.new(order_params)
      if @user_order.valid?
         @user_order.save
         redirect_to action: :index
      else
        render action: "/path/to/rails/app/views/orders/index"
      end
  end

  private
  def order_params
    params.require(:user_order).permit(:post, :prefecture_id, :city, :address, :bilding, :tel)
  end

end
