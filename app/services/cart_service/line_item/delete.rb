# frozen_string_literal: true

module CartService::LineItem
  class Delete < Operators::Service
    attr_reader :order, :product_id, :line_item

    def initialize(order, product_id)
      @order = order
      @product_id = product_id
    end

    def call
      fetch_line_item

      return line_item if line_item.failure?

      destroy_line_item

      success(line_item)
    end

    private

    def fetch_line_item
      @line_item = LineItemQuery::Find.call(order, product_id)
    end

    def destroy_line_item
      line_item.value.destroy
    end

    def create_params
      { order: order, product: product, quantity: params[:quantity] }
    end
  end
end
