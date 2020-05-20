# User.create([
#   {nickname:"aaa", email:"aaa@aaa", password:"11111111", family_name:"あああ", first_name:"あああ", family_furigana:"あああ", first_furigana:"あああ", birthday:"11111111"}
# ])

Product.create([
  {name:"商品１", descripitons: "商品説明１", delivery_address_id: "1", fee: "出品者負担", delivery_time: "1", price: "1000", user_id: "1", brand_id:"1", category_id: "20",}
])

Image.create([
  {image: File.open("./public/uploads/image/image/1/dog.jpg")}
])