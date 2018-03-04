class Store < ApplicationRecord
    has_many :store_products
    has_many :products, through: :store_products
    has_many :deliveries
    has_many :pullouts
    has_many :ending_inventories
    accepts_nested_attributes_for :store_products, reject_if: :all_blank, allow_destroy: true

    def total_sales
        total_sales = 0.0
        ending_inventories.each do |ending_inventory|
            total_sales += ending_inventory.total_sales
        end
        total_sales
    end
    
    def total_cogs
        total_cogs = 0.0
        ending_inventories.each do |ending_inventory|
            total_cogs += ending_inventory.total_cogs
        end
        total_cogs
    end

    def self.total_sales
        @store = Store.all
        total_sales = 0.0
        @store.each do |store|
            total_sales += store.total_sales
        end
        total_sales
    end

    def self.total_cogs
        @store = Store.all
        total_cogs = 0.0
        @store.each do |store|
            total_cogs += store.total_cogs
        end
        total_cogs
    end
end
