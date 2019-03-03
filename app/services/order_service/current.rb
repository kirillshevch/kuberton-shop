# frozen_string_literal: true

module OrderService
  class Current < Operators::Service
    attr_reader :user, :current_order

    def initialize(user)
      @user = user
    end

    def call
      @current_order = fetch_order
      @current_order = create_order if fetch_order.failure?

      @current_order
    end

    private

    def fetch_order
      @fetch_order ||= OrderQuery::Current.call(user)
    end

    def create_order
      @create_order ||= OrderService::Create.call(user)
    end
  end
end
