class Store < ApplicationRecord
    has_many :store_products
    has_many :products, through: :store_products
    has_many :deliveries
    has_many :pullouts
    has_many :ending_inventories
    accepts_nested_attributes_for :store_products, reject_if: :all_blank, allow_destroy: true
end
