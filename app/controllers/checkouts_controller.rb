class CheckoutsController < ApplicationController
  def complete
    if session[:order][:completed]
      order_id = session[:order][:id]

      OrderService::Current.call(current_user).value.update(status: :paid)

      redirect_to root_path, flash: { success: "Order: #{order_id} completed!" }
      ApplicationMailer.new_order(current_user.email).deliver_now
    else
      redirect_to root_path, flash: { error: "Order failed to be completed!" }
    end
  end

  def show
    session[:order] = OrderSerializer.new(OrderService::Current.call(current_user).value).as_json

    redirect_to ENV['CHECKOUT_ENDPOINT'] + '?session=' + session.id
  end
end
