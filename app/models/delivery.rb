class Delivery < ApplicationRecord
  # Entity relationships
  belongs_to :store
  has_many :delivery_products
  has_one :transfer
  accepts_nested_attributes_for :delivery_products, reject_if: :all_blank,allow_destroy: true

  # Validation
  validates :store, :description, :delivery_products, presence: true
  validate :delivery_products_unique

  def delivery_products_unique
    products = []
    delivery_products.each do |delivery_product|
        products << delivery_product.product
    end
    if products.size != products.uniq.size
        errors.add(:delivery_products,'Supplier products must be unique.')
    end
  end

  def items 
    total_items = 0
    delivery_products.each do |dp|
      total_items += dp.quantity
    end
    total_items
  end

  def cost
    total_cost = 0.0
    delivery_products.each do |dp|
      total_cost += dp.product.cost
    end
    total_cost
  end

  def price
    total_price = 0.0
    delivery_products.each do |dp|
      total_price += dp.product.price
    end
    total_price
  end
end
