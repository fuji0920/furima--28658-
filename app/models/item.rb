class Item < ApplicationRecord
  has_one_attached :image

extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_status
  belongs_to :shipping_fee_status
  belongs_to :shipping_area
  belongs_to :shipping_days

  with_options presence: true do
    validates :image, :name, :text, :price  
  end

  validates :price, format: { with: /^[0-9]*$/, message: "is invalid. Input half-width characters."}
  validates :price, numericality: { greater_than: 300, less_than: 9999999, message: "Out of setting range."}  
  
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :product_status_id
    validates :shipping_fee_status_id
    validates :shipping_area_id
    validates :hipping_days_id
  end
end
