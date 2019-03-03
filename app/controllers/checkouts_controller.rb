class CheckoutsController < ApplicationController
  def show
    session[:order] = OrderSerializer.new(OrderService::Current.call(current_user).value).as_json

    redirect_to ENV['CHECKOUT_ENDPOINT'] + '?session=' + session.id
  end
end
