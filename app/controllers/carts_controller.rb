class CartsController < ApplicationController
  check_user
  check_order

  def show
    @line_items = current_order.line_items
  end
end
