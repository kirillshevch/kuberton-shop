# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders

  enum currency_type: {
    usd: 0
  }, _suffix: true

  def active_orders_count
    orders.where(status: :in_progress).count
  end

end
