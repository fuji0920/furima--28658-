class UserOrder
  include ActiveModel::Model
  attr_accessor :post, :shipping_area_id, :city, :address, :building, :tel, :item_id, :user_id, :token

  with_options presence: true do
    validates :post, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Postal code Input correctly" } 
    validates :tel,  format: { with: /\A[0-9]+\z/, message: "is invalid. Phone number Input only number" } 
    validates :tel,  length: { maximum: 11 }
    validates :city, :address, :item_id, :user_id, :token
  end

  validates :shipping_area_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post: post, shipping_area_id: shipping_area_id, city: city, address: address, building: building, tel: tel, order_id: order.id)
  end

end