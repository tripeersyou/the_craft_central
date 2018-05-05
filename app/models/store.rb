class Store < ApplicationRecord
    # Entity realationships
    has_many :store_products
    has_many :products, through: :store_products
    has_many :deliveries
    has_many :pullouts
    has_many :ending_inventories
    accepts_nested_attributes_for :store_products, reject_if: :all_blank, allow_destroy: true

    # Validation
    validate :contact_number_valid_length
    validates :name, :address, :contact_number, presence: true
    validate :store_products_unique
    
    def contact_number_valid_length
        if !contact_number.nil?
            if contact_number.length > 20
                errors.add(:contact_number, 'Contact number should not exceed 20 characters')
            end
        end
    end

    def store_products_unique
        products = []
        store_products.each do |store_product|        
            products << store_product.product
        end
        if products.size != products.uniq.size
            errors.add(:name,'Consignment store products must be unique.')
        end 
    end

    # Instance methods
    def transfers
        Transfer.all.where(store_from_id: id)
    end

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

    def total_products
        total_products = 0
        store_products.each do |store_product|
            total_products += store_product.inventory
        end
        total_products
    end

    def sold_items
        sold_items = 0
        if !ending_inventories.empty?
            ending_inventories.each do |ending_inventory|
                ending_inventory.ending_inventory_products.each do |ending_inventory_product|
                    sold_items += ending_inventory_product.beginning_quantity - ending_inventory_product.ending_quantity
                end
            end
        end
        sold_items
    end

    # Static Methods
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
