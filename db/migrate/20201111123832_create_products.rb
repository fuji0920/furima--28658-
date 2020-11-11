class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|

      t.string  :name,                   null: false
      t.text    :text,                   null: false
      t.integer :category_id,            null: false
      t.integer :product_status_id,      null: false
      t.integer :shipping_fee_status_id, null: false
      t.integer :shipping_area_id,       null: false
      t.integer :shipping_days_id,       null: false
      t.integer :price,                  null: false
      t.integer :user,                   foreign_key: true
      t.timestamps
    end
  end
end
