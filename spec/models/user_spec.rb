require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    it "nicknameが空では登録できないこと" do
    end
    it "emailが空では登録できないこと" do
    end
    it "emailに＠が含まれていること" do
    end
    it "重複したemailが存在する場合登録できないこと" do
    end
    it "passwordが空では登録できないこと" do
    end
    it "passwordが６文字以上で登録できること" do
    end
    it "passwordが5文字以下で登録できないこと" do
    end
    it "パスワードは半角英数字混合で登録できること" do
    end
    it "パスワードは半角英字のみで登録できないこと" do
    end
    it "パスワードは半角数字のみで登録できないこと" do
    end
    it "passwordとpassword_confirmationが不一致では登録できないこと" do
    end
    it "last_nameが空では登録できないこと" do
    end
    it "last_nameが全角（漢字・ひらがな・カタカナ）で登録できること" do
    end
    it "first_nameが空では登録できないこと" do
    end
    it "first_nameが全角（漢字・ひらがな・カタカナ）であること" do
    end
    it "last_name_kanaが空では登録できないこと" do
    end
    it "last_name_kanaが全角（カタカナ）であること" do
    end
    it "first_name_kanaが空では登録できないこと" do
    end
    it "first_name_kanaが全角（カタカナ）であること" do
    end
    it "birthdayが空では登録できないこと" do
    end

end
