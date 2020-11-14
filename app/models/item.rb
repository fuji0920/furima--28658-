class Item < ApplicationRecord
  has_one_attached :image

extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_status
  belongs_to :shipping_fee_status
  belongs_to :shipping_area
  belongs_to :shipping_days

  validates :name, :text, presence: true
  validates :category_id,       numericality: { other_than: 1 }
  validates :product_status_id, numericality: { other_than: 1 }
  validates :shipping_fee_status_id, numericality: { other_than: 1 }
  validates :shipping_area_id,  numericality: { other_than: 1 }
  validates :hipping_days_id,   numericality: { other_than: 1 }

end
