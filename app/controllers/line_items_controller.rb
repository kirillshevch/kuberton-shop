# frozen_string_literal: true

class LineItemsController < ApplicationController
  check_user_order

  def create
    @result = CartService::LineItem::Create.call(current_order, create_params)

    redirect_back_result(@result)
  end

  def destroy
    @result = CartService::LineItem::Delete.call(current_order, params[:product_id])

    redirect_back_result(@result)
  end

  private

  def create_params
    params.require(:line_item).permit(:product_id, :quantity)
  end
end
