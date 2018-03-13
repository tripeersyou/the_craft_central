class OrdersController < ApplicationController
    before_action :set_supplier
    def show
        @order = Order.find(params[:id])
    end
    def new
        @order = @supplier.orders.new
    end
    def create
        @order = @supplier.orders.new(order_params)
        @order.total_items = @order.total_quantity

        @order.order_products.each do |order_product|
            order_product.product.inventory += order_product.quantity
            order_product.product.save
        end 

        if @order.save 
            supplier_path(@supplier)
        else
            render :new
        end
    end
    private
        def order_params
            params.require(:order).permit!
        end 
        def set_supplier
            @supplier = Supplier.find(params[:supplier_id])
        end
end
