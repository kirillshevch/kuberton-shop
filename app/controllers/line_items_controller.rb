# frozen_string_literal: true

class LineItemsController < ApplicationController
  check_user_order

  def create
    @result = CartService::LineItem::Create.call(current_order, **create_params)

    if @result.success?
      redirect_to :back
    else
      redirect_with_error :back, @result.value
    end
  end

  def destroy
    @result = CartService::LineItem::Delete.call(current_order, params[:product_id])

    if @result.success?
      redirect_to :back
    else
      redirect_with_error :back, @result.value
    end
  end

  private

  def create_params
    params.permit(:product_id, :quantity)
  end
end
