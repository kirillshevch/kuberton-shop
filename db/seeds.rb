Product.delete_all

250.times do |i|
  Product.create({
    name: Faker::Hipster.words(3).join(' '),
    image: Faker::Avatar.image,
    description: Faker::Lorem.paragraphs(15).join(' '),
    small_description: Faker::Lorem.paragraphs(5).join(' '),
    price: rand(100)
  })
end
