class PulloutProduct < ApplicationRecord
  # Entity Relationship
  belongs_to :pullout
  belongs_to :product

  # Validation
  validates :product, :quantity, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0, allow_nil: false }
end
