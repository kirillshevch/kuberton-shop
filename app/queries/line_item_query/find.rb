# frozen_string_literal: true

module LineItemQuery
  class Find < Operators::Service
    attr_reader :scope, :order, :product_id

    def initialize(order, product_id)
      @order = order
      @product_id = product_id
    end

    def call
      @scope = base_scope
      @scope = by_id

      @scope.present? ? success(@scope) : failure(:not_found)
    end

    def base_scope
      order.line_items
    end

    def by_id
      scope.find_by(product_id: product_id)
    end
  end
end
