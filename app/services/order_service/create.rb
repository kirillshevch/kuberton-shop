# frozen_string_literal: true

module OrderService
  class Create < Operators::Service
    attr_reader :user, :order

    def initialize(user)
      @user = user
    end

    def call
      create_order

      order.valid? ? success(order) : failure(order.errors)
    end

    private

    def create_order
      @order = Order.create(user: user, status: :in_progress)
    end
  end
end
