class Supplier < ApplicationRecord
    # Entity Relationship
    has_many :orders
    has_many :supplier_products
    has_many :products, through: :supplier_products
    accepts_nested_attributes_for :supplier_products, reject_if: :all_blank, allow_destroy: true
    
    # Validation
    validates :name, :address, :email, :contact_person, :contact_number, presence: true
end
