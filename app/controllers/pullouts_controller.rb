class PulloutsController < ApplicationController
    before_action :set_store
    def new
        if @store.total_products == 0
            redirect_to store_path(@store), notice: "#{@store.name} currently has 0 products."
        else
            @pullout = @store.pullouts.new
        end
    end

    def create
        @pullout = @store.pullouts.new(pullout_params)
        total_items = 0
        total_price = 0.0
        total_cost = 0.0

        @pullout.pullout_products.each do |pullout_product|
            pullout_product.price = pullout_product.quantity * pullout_product.product.price
            pullout_product.cost = pullout_product.quantity * pullout_product.product.cost
            pullout_product.product.inventory += pullout_product.quantity
            pullout_product.product.save
            total_items += pullout_product.quantity
            total_price += pullout_product.quantity * pullout_product.product.price
            total_cost += pullout_product.quantity * pullout_product.product.cost
        end

        @pullout.total_cost = total_cost
        @pullout.total_items = total_items
        @pullout.total_price = total_price

        @pullout.pullout_products.each do |pullout_product|
            pullout_product.save
        end

        @pullout.pullout_products.each do |pullout_product|
            @store.store_products.each do |store_product|
                if pullout_product.product == store_product.product
                    store_product.inventory -= pullout_product.quantity
                    store_product.save
                end
            end
        end

        if @pullout.save
            @store.clean
            redirect_to store_path(@store), notice: 'Pullout successfully created'
        else
            render :new
        end
    end

    def show
        @pullout = Pullout.find(params[:id])

        respond_to do |format|
            format.xls do 
                headers["Content-Disposition"] =  "attachment; filename=\"Pullout #{@pullout.store.name} - #{@pullout.created_at.strftime('%B %d %Y')}.xls\""
            end
            format.html
        end
    end
    private
        def pullout_params
            params.require(:pullout).permit!
        end
        def set_store
            @store = Store.find(params[:store_id])
end     end
