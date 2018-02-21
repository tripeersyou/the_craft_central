class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update]
    def index
        if !params[:sort_by]
            @products = Product.paginate(page: params[:page], per_page: 14).order('updated_at DESC')            
        else
            @products = Product.paginate(page: params[:page], per_page: 14).order(params[:sort_by] + ' DESC')
        end
    end

    def new
        @product = Product.new
    end

    def create
        brand = Brand.all.where(id: product_params[:brand_id]).first
        if brand.nil?
            brand = Brand.new({name: product_params[:brand_id]})
            brand.save
            product = Product.new(product_params)
            product.brand = brand
            if product.save
                redirect_to products_path
            else
                render :new
            end
        else
            product = Product.new(product_params)
            if product.save
                redirect_to products_path
            else
                render :new
            end
        end
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
