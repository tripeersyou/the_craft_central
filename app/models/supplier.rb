class Supplier < ApplicationRecord
    # Entity Relationship
    has_many :orders
    has_many :supplier_products
    has_many :products, through: :supplier_products
    # accepts_nested_attributes_for :supplier_products, reject_if: :all_blank, allow_destroy: true
    
    # Validation
    validate :contact_number_valid_length
    validates :name, :address, :contact_number, presence: true
    validate :supplier_products_unique
    
    def contact_number_valid_length
        if !contact_number.nil?
            if contact_number.length > 20
                errors.add(:contact_number, 'Contact number should not exceed 20 characters')
            end
        end
    end

    def supplier_products_unique
        products = []
        supplier_products.each do |supplier_product|
            products << supplier_product.product
        end
        if products.size != products.uniq.size
            errors.add(:supplier_products,'Supplier products must be unique.')
        end
    end

    def products_delivered
        products_delivered = 0
        orders.each do |order|
            order.order_products.each do |order_product|
                products_delivered += order_product.quantity
            end
        end
        products_delivered
    end
end
