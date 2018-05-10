class TransfersController < ApplicationController
    before_action :set_store
    def new
        if !Store.all.where('id != ' + @store.id.to_s).empty? && @store.total_products > 0
            @transfer = Transfer.new({store_from_id: @store.id})
        else
            redirect_to store_path(@store), notice: "#{@store.name} currently has 0 products/There are no other stores."
        end
    end
    def create
        @transfer = Transfer.new(transfer_params)

        @transfer.store_from_id = @store.id
        delivery = Delivery.new({store: @transfer.store_to, status: false})
        pullout = Pullout.new({store: @store})

        @transfer.transfer_products.each do |transfer_product|
            delivery.delivery_products << DeliveryProduct.new({
                product: transfer_product.product, 
                quantity: transfer_product.quantity, 
                price: (transfer_product.product.price * transfer_product.quantity), 
                cost: (transfer_product.product.cost * transfer_product.quantity)
            })
            pullout.pullout_products << PulloutProduct.new({
                product: transfer_product.product, 
                quantity: transfer_product.quantity, 
                price: (transfer_product.product.price * transfer_product.quantity), 
                cost: (transfer_product.product.cost * transfer_product.quantity)
            })
        end

        pullout.pullout_products.each do |pullout_product|
            Product.all.each do |product|
                if pullout_product.product == product
                    product.inventory += pullout_product.quantity
                    product.save
                end
            end
            @store.store_products.each do |store_product|
                if store_product.product == pullout_product.product
                    store_product.inventory -= pullout_product.quantity
                    store_product.save
                end
            end
        end

        delivery.total_items = delivery.items
        delivery.total_cost = delivery.cost
        delivery.total_price = delivery.price  
        delivery.description = "Product transfer from #{@store.name} to #{@transfer.store_to.name}"
        
        pullout.description = "Product transfer from #{@store.name} to #{@transfer.store_to.name}"
        pullout.total_items = pullout.items
        pullout.total_cost = pullout.cost
        pullout.total_price = pullout.price  

        delivery.save
        pullout.save

        @transfer.delivery = delivery
        @transfer.pullout = pullout
        if @transfer.save
            @store.clean
            redirect_to store_path(@store), notice: 'Transfer successfully created'
        else
            render :new
        end

    end
    def show
        @transfer = Transfer.find(params[:id])
        respond_to do |format|
            format.xls do
                headers["Content-Disposition"] =  "attachment; filename=\"Transfer from #{@transfer.store_from.name} to #{@transfer.store_to.name}- #{@transfer.created_at.strftime('%B %d %Y')}.xls\""
            end
            format.html
        end
    end
    private 
        def set_store
            @store = Store.find(params[:store_id])
        end
        def transfer_params
            params.require(:transfer).permit!
        end
end