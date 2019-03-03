# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout_by_resource

  # before_action :configure_permitted_parameters, if: :devise_controller?

  # def configure_permitted_parameters
  #   update_attrs = %i[password password_confirmation current_password]
  #   devise_parameter_sanitizer.permit(:account_update, keys: update_attrs)
  # end

  def current_order
    @current_order ||= OrderService::Current.call(user)
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
