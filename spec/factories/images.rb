FactoryBot.define do

  factory :image do
    picture{File.open"#{Rails.root}/public/uploads/image/ダウンロード.jpg"}
    association :product, factory: :product
  end
end