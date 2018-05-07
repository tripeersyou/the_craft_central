class Product < ApplicationRecord
    require 'csv'
    # Entity relationships
    belongs_to :brand
    has_many :delivery_products
    has_many :pullout_products
    has_many :ending_inventory_products
    has_many :order_products
    has_many :transfer_products
    has_many :store_products
    has_many :stores, through: :store_products
    has_many :supplier_products
    has_many :suppliers, through: :supplier_products

    # Validation
    validates :sku, :name, :brand, :description, :limit, :price, :cost, :inventory, presence: true
    validates :limit, :price, :cost, numericality: { greater_than: 0, allow_nil: false }
    validates :inventory, numericality: {greater_than_or_equal_to: 0, allow_nil: false}
    validates :sku, uniqueness: true
        
    # Instance methods
    def to_s
        name
    end

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            product = Product.new
            product.sku = row[0]
            product.name = row[1]
            brand = Brand.find_by_name(row[2])
            if !brand.nil?
                product.brand = brand
            else
                brand = Brand.create({name: row[2]})
                product.brand = brand
            end
            product.description = row[3]
            product.price = row[4]
            product.limit = row[5]
            product.cost = row[6]
            product.inventory = row[7]
            puts product
            product.save
        end
    end

    def stocks_left
        stocks_left = 0
        store_products.each do |store_product|
            stocks_left += store_product.inventory
        end
        stocks_left
    end

    def cogs
        cogs = 0.0
        ending_inventory_products.each do |ending_inventory_product|
            if id == ending_inventory_product.product.id
                cogs += ((ending_inventory_product.beginning_quantity - ending_inventory_product.ending_quantity) * ending_inventory_product.cost)
            end
        end
        cogs
    end

    def quantity_sold
        quantity_sold = 0
        EndingInventory.all.each do |ending_inventory|
            ending_inventory.ending_inventory_products.each do |ending_inventory_product|
                if id == ending_inventory_product.product.id
                    quantity_sold += (ending_inventory_product.beginning_quantity - ending_inventory_product.ending_quantity)
                end
            end
        end
        quantity_sold
    end

    def sales
        sales = 0.0
        EndingInventory.all.each do |ending_inventory|
            ending_inventory.ending_inventory_products.each do |ending_inventory_product|
                if id == ending_inventory_product.product.id
                    sales += ((ending_inventory_product.beginning_quantity - ending_inventory_product.ending_quantity) * ending_inventory_product.price)
                end
            end
        end
        sales
    end
end
