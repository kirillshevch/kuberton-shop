class ProductSerializer < Operators::Serializer
  def as_json
    {
      id: id,
      name: name,
      price: price,
      image: image,
      description: description,
      small_description: small_description
    }
  end
end
