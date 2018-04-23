class DeliveryProduct < ApplicationRecord
  # Entity relationships
  belongs_to :delivery
  belongs_to :product

  # Validation
  validate :delivery_product_must_be_valid
  validates :product, :quantity, presence: true
  validates :quantity, numericality: {greater_than: 0}

  def delivery_product_must_be_valid
    if !transfer.nil?
      if quantity > product.limit
        errors.add(:quantity, "can't be greater than the specified product limit.")
      else
        if quantity > product.inventory
          errors.add(:quantity, "can't be greater than the  current number of stocks on hand.")
        end
      end
    end
  end
end
