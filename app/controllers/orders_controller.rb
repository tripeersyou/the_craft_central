class OrdersController < ApplicationController
    before_action :set_supplier
    def show
        @order = Order.find(params[:id])

        respond_to do |format|
            format.xls do
                headers["Content-Disposition"] =  "attachment; filename=\"Order from #{@order.supplier.name} - #{@order.created_at.strftime('%B %d %Y')}.xls\""
            end
            format.html
        end
    end
    def new
        @order = @supplier.orders.new
        @order.order_products.build
    end
    def create
        @order = @supplier.orders.new(order_params)

        if @order.save
            @order.total_items = @order.total_quantity
            @order.order_products.each do |order_product|
                order_product.product.inventory += order_product.quantity
                order_product.product.save
            end 
            redirect_to supplier_path(@supplier), notice: 'Successfully created a new order.'
        else
            render :new
        end
    end
    private
        def order_params
            if !params[:order].nil?
                params.require(:order).permit!
            end
        end 
        def set_supplier
            @supplier = Supplier.find(params[:supplier_id])
        end
end
