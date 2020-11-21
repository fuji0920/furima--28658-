require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '商品登録できること' do
      expect(@item).to be_valid
    end

    it '出品画像が空では登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が空では登録できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明が空では登録できないこと' do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end
    it 'カテゴリーが選択されていないと登録できないこと' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Category is not a number')
    end
    it 'カテゴリーで1を選択すると登録できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end
    it '商品の状態が選択されていないと登録できないこと' do
      @item.product_status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Product status is not a number')
    end
    it '商品の状態で1を選択すると登録できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end
    it '配送料の負担が選択されていないと登録できないこと' do
      @item.shipping_fee_status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping fee status is not a number')
    end
    it '配送料の負担で1を選択すると登録できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end
    it '発送元の地域が選択されていないと登録できないこと' do
      @item.product_status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Product status is not a number')
    end
    it '発送元の地域で1を選択すると登録できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end
    it '発送までの日数が選択されていないと登録できないこと' do
      @item.product_status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Product status is not a number')
    end
    it '発送までの日数で1を選択すると登録できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end
    it '価格が空では登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格が全角数字で登録できないこと' do
      @item.price = '１２３４５'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range.')
    end
    it '価格が299で登録できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range.')
    end
    it '価格が10,000,000で登録できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range.')
    end
  end
end
