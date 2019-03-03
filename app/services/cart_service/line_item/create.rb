# frozen_string_literal: true

module CartService::LineItem
  class Create < Operators::Service
    attr_reader :order, :product_id, :quantity, :product, :line_item

    def initialize(order, product_id:, quantity:)
      @order = order
      @product_id = product_id
      @quantity = quantity
    end

    def call
      fetch_product

      return failure(:not_found_product) if product.blank?
      return failure(:item_exist) if fetch_line_item.success?

      create_line_item

      line_item.valid? ? success(line_item) : failure(line_item.errors)
    end

    private

    def fetch_product
      @product = ::Product.find_by(id: product_id)
    end

    def fetch_line_item
      @fetch_line_item ||= LineItemQuery::Find.call(order, product_id)
    end

    def create_line_item
      @line_item = ::LineItem.create(create_params)
    end

    def create_params
      { order_id: order.id, product_id: product.id, quantity: quantity }
    end
  end
end
