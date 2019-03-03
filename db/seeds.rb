10.times do |i|
  Product.create(name: "Product #{i.to_s}", price: rand(100))
end
