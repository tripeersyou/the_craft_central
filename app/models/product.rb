class Product < ApplicationRecord
    has_one :brand
    has_many :delivery_products
    has_many :pullout_products
    has_many :ending_inventory_products
    has_many :beginning_inventory_products
    has_many :order_products
    has_many :transfer_products
    has_many :store_products
    has_many :stores, through: :store_products
    has_many :supplier_products
    has_many :suppliers, through: :supplier_products
end
