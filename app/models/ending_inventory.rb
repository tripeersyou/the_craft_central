class EndingInventory < ApplicationRecord
  belongs_to :store
  has_many :ending_inventory_products
  accepts_nested_attributes_for :ending_inventory_products, reject_if: :all_blank, allow_destroy: true

  # Validation
  validates :ending_inventory_products, presence: true
  validate :ending_inventory_products_unique

  def ending_inventory_products_unique
    products = []
    ending_inventory_products.each do |ending_inventory_product|
        products << ending_inventory_product.product
    end
    if products.size != products.uniq.size
        errors.add(:ending_inventory_products,'Supplier products must be unique.')
    end
  end

  def total_sales
    total_sales = 0.0
    ending_inventory_products.each do |ending_inventory_product|
        total_sales += ((ending_inventory_product.beginning_quantity - ending_inventory_product.ending_quantity) * ending_inventory_product.price)
    end
    total_sales
  end

  def total_items
    total_items = 0
    ending_inventory_products.each do |ending_inventory_product|
        total_items += (ending_inventory_product.beginning_quantity - ending_inventory_product.ending_quantity)
    end
    total_items
  end

  def total_cogs
    total_cogs = 0.00
    ending_inventory_products.each do |ending_inventory_product|
        total_cogs += ((ending_inventory_product.beginning_quantity - ending_inventory_product.ending_quantity) * ending_inventory_product.cost)
    end
    total_cogs
  end

  def self.total_sales_time(start_time, end_time)
    ending_inventories = EndingInventory.where('created_at BETWEEN ? AND ?', start_time, end_time)
    total_sales = 0.00
    ending_inventories.each do |ending_inventory|
      ending_inventory.ending_inventory_products.each do |ending_inventory_product|
          total_sales += ending_inventory.total_items * ending_inventory_product.price
      end
    end
    total_sales
  end

  def self.total_cogs_time(start_time, end_time)
    ending_inventories = EndingInventory.where('created_at BETWEEN ? AND ?', start_time, end_time)
    total_cogs = 0.00
    ending_inventories.each do |ending_inventory|
      total_cogs = ending_inventory.total_cogs
    end
    total_cogs
  end

  def self.total_sales
    ending_inventories = EndingInventory.all
    total_sales = 0.00
    ending_inventories.each do |ending_inventory|
      ending_inventory.ending_inventory_products.each do |ending_inventory_product|
          total_sales += ending_inventory.total_items * ending_inventory_product.price
      end
    end
    total_sales
  end

  def self.total_cogs
    ending_inventories = EndingInventory.all
    total_cogs = 0.00
    ending_inventories.each do |ending_inventory|
      total_cogs += ending_inventory.total_cogs
    end
    total_cogs
  end

end