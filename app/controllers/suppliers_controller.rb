class SuppliersController < ApplicationController
    before_action :set_supplier, only: [:show, :edit, :update]
    def index
        if params[:supplier_sort] and params[:supplier_sort] != ""
            if params[:supplier_search] and params[:supplier_search] != ""
                q_string = '%'+params[:supplier_search]+'%'
                @suppliers = Store.paginate(page: params[:page], per_page: 9).where('name LIKE ?', q_string).order(params[:supplier_sort] + ' ASC')
            else
                @suppliers = Store.paginate(page: params[:page], per_page: 9).order(params[:supplier_sort] + ' ASC')
            end
        else
            if params[:supplier_search] and params[:supplier_search] != ""
                q_string = '%'+params[:supplier_search]+'%'
                @suppliers = Supplier.paginate(page: params[:page], per_page: 9).where('name LIKE ?', q_string)
            else
                @suppliers = Supplier.paginate(page: params[:page], per_page: 9)
            end
        end
    end
    def new
        @supplier = Supplier.new
    end
    def create
        @supplier = Supplier.new(supplier_params)
        if @supplier.save
            redirect_to supplier_path(@supplier), notice: "#{@supplier.name} successfully created"
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
            redirect_to supplier_path(@supplier), notice: "#{@supplier.name} successfully updated" 
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
