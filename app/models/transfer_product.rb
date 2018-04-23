class TransferProduct < ApplicationRecord
  # Entity Relationship
  belongs_to :transfer
  belongs_to :product

  # Validation
  validates :product, :quantity, presence: true
  validates :quantity, numericality: {greater_than: 0}
  validate :quantity_should_be_valid

  # Custom Validation
  def quantity_should_be_valid
    store = store_from
    store.store_products.each do |store_product|
      if product == product
        if quantity > store_product.inventory
          errors.add('Cannot be more than the current inventory')
        end
      end
    end
  end

end
