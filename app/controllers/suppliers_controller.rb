class SuppliersController < ApplicationController
    before_action :set_supplier, only: [:show, :edit, :update]
    def index
        if !params[:sort_by]
            @suppliers = Supplier.paginate(page: params[:page], per_page: 14)
        else
            @suppliers = Supplier.paginate(page: params[:page], per_page: 14).order('name ' + params[:sort_by])
        end
    end
    def new
        @supplier = Supplier.new
    end
    def create
        @supplier = Supplier.new(supplier_params)
        if @supplier.save
            redirect_to supplier_path(@supplier)
        else
            render :new
        end
    end
    def show
        @products = @supplier.supplier_products.paginate(page: params[:products_page], per_page: 5).order('created_at DESC')
        @orders = @supplier.orders.paginate(page: params[:orders_page], per_page: 5).order('created_at DESC')
    end
    def edit
    end
    def update
        if @supplier.update(supplier_params)
            redirect_to supplier_path(@supplier)
        else
            render :new
        end
    end
    private
        def supplier_params
            params.require(:supplier).permit!
        end
        def set_supplier
            @supplier = Supplier.find(params[:id])
        end
end
