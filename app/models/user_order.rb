class UserOrder
  include ActiveModel::Model
  attr_accessor :post, :prefecture_id, :city, :address, :bilding, :tel

  with_options presence: true do
    validates :post, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Postal code Input correctly" }
    validates :tel,  format: { with: /\A\d{11}\z/, message: "is invalid. Phone number Input only number"}
    validates :city, :address, :bilding 

    validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
    
  end

  def save
    order = Order.create
    Address.create(post: post, prefecture_id: prefecture_id, city: city, address: address, bilding: bilding, tel: tel, order_id: order.id)
  end
end
