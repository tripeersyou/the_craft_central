class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :product, :quantity, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0, allow_nil: false }
end
