class Order < ApplicationRecord
  belongs_to :user, optional: true

  has_many :line_items
end
