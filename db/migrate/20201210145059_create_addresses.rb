class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :post,           null: false
      t.integer    :prefecture_id,  null: false
      t.string     :city,           null: false
      t.string     :address,        null: false
      t.string     :bilding,
      t.string     :tel,            null: false
      t.integer    :order_id,       foreign_key: true
      t.timestamps
    end
  end
end