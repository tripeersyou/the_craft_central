class SupplierProduct < ApplicationRecord
  # Entity Relationships
  belongs_to :supplier
  belongs_to :product

  # Validation
  validates :product, presence: true
end
