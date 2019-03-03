# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout_by_resource

  def self.check_user_order
    before_action :check_user
    before_action :current_order
  end

  private

  def check_user
    @current_user = current_user
    redirect_to new_user_session_path if @current_user.blank?
  end

  def check_order
    redirect_to :not_found if order_fetcher.failure?
  end

  def order_fetcher
    @order_fetcher ||= OrderService::Current.call(current_user)
  end

  def current_order
    @current_order ||= order_fetcher.value if order_fetcher.success?
  end

  def redirect_with_error(path, error)
    redirect_to path, flash: { error: [error].flatten.joins(', ') }
  end

  private

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end
end
