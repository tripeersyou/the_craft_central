class EndingInventory < ApplicationRecord
  belongs_to :store
  has_many :ending_inventory_products
  has_many :beginning_inventory_products
  accepts_nested_attributes_for :ending_inventory_products, reject_if: :all_blank, allow_destroy: true

  def total_sales
    total_sales = 0.00
    ending_inventory_products.each do |ending_inventory_product|
      beginning_inventory_products.each do |beginning_inventory_product|
        if ending_inventory_product.product == beginning_inventory_product.product
          total_sales += ending_inventory_product.quantity * beginning_inventory_product.price
        end
      end
    end
    total_sales
  end

  def total_cogs
    total_cogs = 0.00
    ending_inventory_products.each do |ending_inventory_product|
      beginning_inventory_products.each do |beginning_inventory_product|
        if ending_inventory_product.product == beginning_inventory_product.product
          total_cogs += ending_inventory_product.quantity * beginning_inventory_product.cost
        end
      end
    end
    total_cogs
  end

end
