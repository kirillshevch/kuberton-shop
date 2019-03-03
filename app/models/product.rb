class Product < ApplicationRecord
  validates :name, :price, presence: true
  scope :random, -> { order('random()') }
end
