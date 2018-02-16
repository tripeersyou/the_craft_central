class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update]
    def index
        if !params[:sort_by]
            @products = Product.paginate(page: params[:page], per_page: 2).order('updated_at DESC')            
        else
            @products = Product.paginate(page: params[:page], per_page: 2).order('#{params[:sort_by]} DESC')
        end
    end

    def new
        @product = Product.new
    end

    def create
        
    end

    def show
    end

    def edit
    end

    def update
        if @product.update(product_params)
            redirect_to product_path(@product)
        end
    end

    private
        def product_params
            params.require(:product).permit!
        end
        def set_product
            @product = Product.find(params[:id])
        end
end
