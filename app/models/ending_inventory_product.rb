class EndingInventoryProduct < ApplicationRecord
  belongs_to :product
  belongs_to :ending_inventory

  validates :product, :ending_quantity, presence: true
  validates :ending_quantity, numericality: { greater_than_or_equal_to: 0 }
  validate :ending_quantity_valid

  def ending_quantity_valid
    store = ending_inventory.store
    store_products = store.store_products
    store_products.each do |store_product|
      if store_product.product == product
        if store_product.inventory < ending_quantity
          errors.add("Ending quantity can't be more than the ")
        end
      end
    end
  end
end
