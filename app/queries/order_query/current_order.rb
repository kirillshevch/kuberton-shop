# frozen_string_literal: true

module OrderQuery
  class CurrentOrder < EitherService
    attr_reader :user, :scope

    def initialize(user)
      @user = user
    end

    def call
      @scope
    end
  end
end
