class Transfer < ApplicationRecord
  # Entity Relationship
  belongs_to :store_to, 
    foreign_key: 'store_to_id',
    class_name: 'Store'
  belongs_to :store_from, 
    foreign_key: 'store_from_id', 
    class_name: 'Store'
  belongs_to :pullout
  belongs_to :delivery
  has_many :transfer_products
  accepts_nested_attributes_for :transfer_products, reject_if: :all_blank,allow_destroy: true
  
  # Validation
  validates :store_to, presence: true
  validates :transfer_products, presence: true
  validates :delivery, :pullout, presence: true
  validate :transfer_products_unique

  def transfer_products_unique
    products = []
    transfer_products.each do |transfer_product|
        products << transfer_product.product
    end
    if products.size != products.uniq.size
        errors.add(:store_to,'Supplier products must be unique.')
    end
  end

  def total_items
	  total_items = 0
	  transfer_products.each do |transfer_product|
	  	total_items += transfer_product.quantity
	  end
	  total_items
  end
end
