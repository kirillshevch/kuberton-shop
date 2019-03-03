class LineItemSerializer < Operators::Serializer
  def as_json
    {
      id: id,
      product: ProductSerializer.new(product).as_json,
      quantity: quantity
    }
  end
end
