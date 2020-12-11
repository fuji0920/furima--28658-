class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :post,           null: false
      t.integer    :prefecture_id,  null: false

      |prefecture_id          |integer|null: false|
      |city                   |string |null: false|
      |address                |string |null: false|
      |bilding                |string |-------|
      |tel                    |string |null: false|
      |purchase_record_id    |integer|foreign_key: true|
      t.timestamps
    end
  end
end
