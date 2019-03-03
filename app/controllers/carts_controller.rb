class CartsController < ApplicationController
  check_user_order

  def show
    @line_items = current_order.line_items.includes(:product)
  end
end
