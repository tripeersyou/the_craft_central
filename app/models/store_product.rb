class StoreProduct < ApplicationRecord
  # Entity Relationship
  belongs_to :store
  belongs_to :product

  # Validation
  validates :product, :inventory, presence: true
  validates :inventory, numericality: { greater_than_or_equal_to: 0, allow_nil: false }

  def cogs
    cogs = 0.0
    store.ending_inventories.each do |ending_inventory|
      ending_inventory.ending_inventory_products.each do |ending_inventory_product|
          if product == ending_inventory_product.product
            cogs += ((ending_inventory_product.beginning_quantity - ending_inventory_product.ending_quantity) * ending_inventory_product.cost)
          end
      end
    end
    cogs
  end

  def sales
      sales = 0.0
      store.ending_inventories.each do |ending_inventory|
        ending_inventory.ending_inventory_products.each do |ending_inventory_product|
          sales += ((ending_inventory_product.beginning_quantity - ending_inventory_product.ending_quantity) * ending_inventory_product.price)
        end
      end
      sales
  end
end
