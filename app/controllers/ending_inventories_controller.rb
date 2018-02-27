class EndingInventoriesController < ApplicationController
    before_action :set_store
    def new
        @ending_inventory = @store.ending_inventories.new
    end
    def create
        ending_inventory = @store.ending_inventories.new(ending_inventory_params)

        ending_inventory.ending_inventory_products.each do |ending_inventory_product|
            beginning_inventory_product = BeginningInventoryProduct.new
            beginning_inventory_product.ending_inventory = ending_inventory
            beginning_inventory_product.product = ending_inventory_product.product
            beginning_inventory_product.product = ending_inventory_product.product
            beginning_inventory_product.price = ending_inventory_product.product.price
            beginning_inventory_product.cost = ending_inventory_product.product.cost
            @store.store_products.each do |store_product|
                if store_product.product == ending_inventory_product.product
                    beginning_inventory_product.quantity = store_product.inventory
                    store_product.inventory = ending_inventory_product.quantity
                    store_product.save
                end
            end
            beginning_inventory_product.save            
        end

        if ending_inventory.save
            redirect_to store_path(@store)
        else
            render :new
        end
    end
    def show

    end
    def edit

    end
    private
        def set_store
            @store = Store.find(params[:store_id])
        end
        def ending_inventory_params
            params.require(:ending_inventory).permit!
        end
end
