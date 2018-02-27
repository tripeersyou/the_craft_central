class DeliveriesController < ApplicationController
    before_action :set_store

    def new
        @delivery = @store.deliveries.new
    end

    def create
        delivery = @store.deliveries.new(delivery_params)
        total_items = 0
        total_price = 0.0
        total_cost = 0.0

        delivery.delivery_products.each do |delivery_product|
            delivery_product.product.inventory -= delivery_product.quantity
            delivery_product.price = delivery_product.quantity * delivery_product.product.price
            delivery_product.cost = delivery_product.quantity * delivery_product.product.cost
            delivery_product.product.save
            total_items += delivery_product.quantity
            total_price += delivery_product.quantity * delivery_product.product.price
            total_cost += delivery_product.quantity * delivery_product.product.cost
        end

        delivery.total_cost = total_cost
        delivery.total_items = total_items
        delivery.total_price = total_price

        delivery.delivery_products.each do |delivery_product|
            delivery_product.save
        end

        if delivery.status
            delivery.delivery_products.each do |delivery_product|            
                if !@store.products.include? delivery_product.product
                    @store.products << delivery_product.product
                    @store.save     
                end

                @store.store_products.each do |store_product|
                    if delivery_product.product  == store_product.product
                        store_product.inventory += delivery_product.quantity
                        store_product.save
                    end
                end 
            end
        end

        if delivery.save
            redirect_to store_path(@store)
        else
            render :new
        end
    end

    def show
        @delivery = Delivery.find(params[:id])
    end

    def update
        delivery = Delivery.find(params[:id])
        if !delivery.status
            delivery.status = true
            
            delivery.delivery_products.each do |delivery_product|            
                if !@store.products.include? delivery_product.product
                    @store.products << delivery_product.product
                    @store.save     
                end

                @store.store_products.each do |store_product|
                    if delivery_product.product  == store_product.product
                        store_product.inventory += delivery_product.quantity
                        store_product.save
                    end
                end 
            end
            delivery.save
            redirect_to store_path(@store)
        end
    end

    private
        def delivery_params
            params.require(:delivery).permit!
        end
        def set_store
            @store = Store.find(params[:store_id])
        end

end