# frozen_string_literal: true

module OrderQuery
  class Current < Operators::Service
    attr_reader :user, :scope

    def initialize(user)
      @user = user
    end

    def call
      @scope = base_scope
      @scope = in_progress_orders
      @scope = last_order

      @scope.present? ? success(@scope) : failure(:not_found)
    end

    def base_scope
      user.orders
    end

    def last_order
      scope.order(:created_at).last
    end

    def in_progress_orders
      scope.in_progress_status
    end
  end
end
