class Pullout < ApplicationRecord
  # Entity Relationship
  belongs_to :store
  has_many :pullout_products
  has_one :transfer
  accepts_nested_attributes_for :pullout_products, reject_if: :all_blank, allow_destroy: true

  # Validation
  validates :store, :description, :pullout_product, presence: true

  # Instance Methods
  def items 
    total_items = 0
    pullout_products.each do |dp|
      total_items += dp.quantity
    end
    total_items
  end

  def cost
    total_cost = 0.0
    pullout_products.each do |dp|
      total_cost += dp.product.cost
    end
    total_cost
  end

  def price
    total_price = 0.0
    pullout_products.each do |dp|
      total_price += dp.product.price
    end
    total_price
  end
end
