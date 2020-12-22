class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :post,           null: false
      t.integer    :prefecture_id,  null: false
<<<<<<< HEAD
      t.string     :city,           null: false
      t.string     :address,        null: false
      t.string     :bilding,
      t.string     :tel,            null: false
      t.integer    :order_id,       foreign_key: true
=======

      |prefecture_id          |integer|null: false|
      |city                   |string |null: false|
      |address                |string |null: false|
      |bilding                |string |-------|
      |tel                    |string |null: false|
      |purchase_record_id    |integer|foreign_key: true|
>>>>>>> parent of b6f5992... マイグレーションファイル作成
      t.timestamps
    end
  end
end
