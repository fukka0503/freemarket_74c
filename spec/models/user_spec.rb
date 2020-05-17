require 'rails_helper'

# RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
describe User do
  describe '#create' do
    it "nicknameがない場合は登録できないこと" do
      user = User.new(nickname: nil, email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name: "あああ", first_name: "あああ", family_furigana: "アアア", first_furigana: "アアア", birthday: "11111111") 
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end
    it "family_nameがない場合は登録できないこと" do
      user = User.new(nickname: "aaa", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name: nil, first_name: "あああ", family_furigana: "アアア", first_furigana: "アアア", birthday: "11111111") 
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end
    it "first_nameがない場合は登録できないこと" do
      user = User.new(nickname: "aaa", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name: "あああ", first_name: nil, family_furigana: "アアア", first_furigana: "アアア", birthday: "11111111") 
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end
    it "family_furiganaがない場合は登録できないこと" do
      user = User.new(nickname: "aaa", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name: "あああ", first_name: "あああ", family_furigana: nil, first_furigana: "アアア", birthday: "11111111") 
      user.valid?
      expect(user.errors[:family_furigana]).to include("を入力してください")
    end
    it "first_furiganaがない場合は登録できないこと" do
      user = User.new(nickname: "aaa", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name: "あああ", first_name: "あああ", family_furigana: "アアア", first_furigana: nil, birthday: "11111111") 
      user.valid?
      expect(user.errors[:first_furigana]).to include("を入力してください")
    end
    it "birthdayがない場合は登録できないこと" do
      user = User.new(nickname: "aaa", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name: "あああ", first_name: "あああ", family_furigana: "アアア", first_furigana: "アアア", birthday: nil) 
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end
  end
end
