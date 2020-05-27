require 'rails_helper'

describe Product do
  describe '#create' do
    context '商品の情報を保存できる場合' do
      let(:user){create(:user)}
      let(:category){create(:category)}
      it "nameがない場合は登録できないこと" do
        product = FactoryBot.build(:product, name: nil)  
        product.valid?
        expect(product.errors[:name]).to include("を入力してください")
      end
      it "descriptionsがない場合は登録できないこと" do
        product = FactoryBot.build(:product, descriptions: nil)  
        product.valid?
        expect(product.errors[:descriptions]).to include("を入力してください")
      end
      it "categoryがない場合は登録できないこと" do
        product = FactoryBot.build(:product, category: nil)
        product.valid?
        expect(product.errors[:category]).to include("を入力してください")
      end
      it "sizeがない場合は登録できないこと" do
        product = FactoryBot.build(:product, size: nil)
        product.valid?
        expect(product.errors[:size]).to include("を入力してください")
      end
      it "qualityがない場合は登録できないこと" do
        product = FactoryBot.build(:product, quality: nil)
        product.valid?
        expect(product.errors[:quality]).to include("を入力してください")
      end
      it "feeがない場合は登録できないこと" do
        product = FactoryBot.build(:product, fee: nil)
        product.valid?
        expect(product.errors[:fee]).to include("を入力してください")
      end
      it "areaの地域がない場合は登録できないこと" do
        product = FactoryBot.build(:product, area: nil)
        product.valid?
        expect(product.errors[:area]).to include("を入力してください")
      end
      it "delivery_timeがない場合は登録できないこと" do
        product = FactoryBot.build(:product, delivery_time: nil)
        product.valid?
        expect(product.errors[:delivery_time]).to include("を入力してください")
      end
      it "priceがない場合は登録できないこと" do
        product = FactoryBot.build(:product, price: nil)
        product.valid?
        expect(product.errors[:price]).to include("を入力してください")
      end
    end
  end
end

