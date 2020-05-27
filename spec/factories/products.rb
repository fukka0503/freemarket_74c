FactoryBot.define do

  factory :product do
    name           {"商品名"}
    descriptions   {"説明"}
    size           {"S"}
    quality        {"新品、未使用"}
    fee            {"着払い(購入者負担)"}
    area           {"大阪府"}
    delivery_time  {"1~2で発送"}
    price          {"10000"}
    status         {"1"}
    brand_id       {"1"}
    association :user, factory: :user
    # association :brand, factory: :brand
    association :category, factory: :category
    after(:build) do |product|
      product.images<< build(:image, product: product)
    end
  end
end