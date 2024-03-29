class EndingInventoriesController < ApplicationController
    before_action :set_store
    def new
        if @store.total_products > 0 
            @ending_inventory = @store.ending_inventories.new
        else
            redirect_to store_path(@store), notice: "#{@store.name} currently has 0 products."
        end
    end
    def create
        @ending_inventory = @store.ending_inventories.new(ending_inventory_params)

        
        if @ending_inventory.save
            @ending_inventory.ending_inventory_products.each do |ending_inventory_product|
                ending_inventory_product.price = ending_inventory_product.product.price
                ending_inventory_product.cost = ending_inventory_product.product.cost
                @store.store_products.each do |store_product|
                    if store_product.product == ending_inventory_product.product
                        ending_inventory_product.beginning_quantity = store_product.inventory
                        store_product.inventory = ending_inventory_product.ending_quantity
                        store_product.save
                    end
                end
            end
            @ending_inventory.sales = @ending_inventory.total_sales
            @ending_inventory.cogs = @ending_inventory.total_cogs
            @ending_inventory.save
            @store.clean
            redirect_to store_path(@store), notice: 'Sales report successfully created.'
        else
            render :new
        end
    end
    def show
        @ending_inventory = EndingInventory.find(params[:id])
        
        respond_to do |format|
            format.xls do
                headers["Content-Disposition"] =  "attachment; filename=\"Sales Report #{@ending_inventory.store.name} - #{@ending_inventory.created_at.strftime('%B %d %Y')}.xls\""
            end
            format.html
        end
    end

    private
        def set_store
            @store = Store.find(params[:store_id])
        end
        def ending_inventory_params
            if !params[:ending_inventory].nil?
                params.require(:ending_inventory).permit!
            end
        end
end
