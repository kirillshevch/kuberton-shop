class OrderSerializer < Operators::Serializer
  def as_json
    {
      id: id,
      line_items: LineItemSerializer.serialize_collection(line_items)
    }
  end
end
