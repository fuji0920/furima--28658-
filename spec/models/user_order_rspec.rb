require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '#create' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end

    it 'ユーザーが購入できること' do
      expect(@user_order).to be_valid
    end

    it "tokenが空では登録できないこと" do
      @user_order.token = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Token can't be blank")
    end

    it 'postが空では登録できないこと' do
      @user_order.post = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Post can't be blank")
    end

    it 'postにハイフンがないと登録できないこと' do
      @user_order.post = '1234567'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Post is invalid. Postal code Input correctly")
    end

    it 'cityが空では登録できないこと' do
      @user_order.city = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("City can't be blank")
    end

    it 'addressが空では登録できないこと' do
      @user_order.address = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Address can't be blank")
    end

    it 'telが空では登録できないこと' do
      @user_order.tel = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Tel can't be blank")
    end

    it 'telにハイフンがあると登録できないこと' do
      @user_order.tel = '090-1234-5678'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Tel is invalid. Phone number Input only number")
    end
  end
end

    