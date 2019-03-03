class CheckoutsController < ApplicationController
  def show
    redirect_to ENV['CHECKOUT_ENDPOINT'] + '?session=' + session.id
  end
end
