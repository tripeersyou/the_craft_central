class Order < ApplicationRecord
  belongs_to :supplier
  has_many :order_products
  accepts_nested_attributes_for :order_products, reject_if: :all_blank,allow_destroy: true

  # Validation
  validates :order_products, presence: true
  validate :order_products_unique

  def order_products_unique
    products = []
    order_products.each do |order_product|
        products << order_product.product
    end
    if products.size != products.uniq.size
        errors.add(:order_products,'Supplier products must be unique.')
    end
  end

  def total_quantity
    total_items = 0
    order_products.each do |order_product|
      total_items += order_product.quantity
    end
    total_items
  end

  def total_cost
    total_cost = 0.0
    order_products.each do |order_product|
      total_cost += order_product.product.cost * order_product.quantity
    end
    total_cost
  end
end
