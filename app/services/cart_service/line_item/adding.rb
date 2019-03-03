# frozen_string_literal: true

module CartService::LineItem
  class Adding < Operators::Service
    attr_reader :line_item, :quantity

    def initialize(line_item, quantity)
      @line_item = line_item
      @quantity = quantity
    end

    def call
      return failure(:blank_quantity) if quantity.blank?

      adding_quantity

      line_item.valid? ? success(line_item) : failure(line_item.errors)
    end

    private

    def adding_quantity
      line_item.update(quantity: line_item.quantity + quantity.to_i)
    end
  end
end
