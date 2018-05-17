class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update]
    def index
        if params[:product_sort] and params[:product_sort] != ""
            if params[:product_search] and params[:product_search] != ""
                q_string = '%'+params[:product_search]+'%'
                @products = Product.paginate(page: params[:page], per_page: 14).where('name LIKE ? or sku LIKE ?', q_string,q_string).order(params[:product_sort] + ' DESC')
            else
                @products = Product.paginate(page: params[:page], per_page: 14).order(params[:product_sort] + ' DESC')
            end
        else
            if params[:product_search] and params[:product_search] != ""
                q_string = '%'+params[:product_search]+'%'
                @products = Product.paginate(page: params[:page], per_page: 14).where('name LIKE ? or sku LIKE ?', q_string,q_string).order('updated_at DESC')
            else
                @products = Product.paginate(page: params[:page], per_page: 14).order('updated_at DESC')
            end
        end
        
        respond_to do |format|
            format.xls do
                @xls_products = Product.all
                headers["Content-Disposition"] =  "attachment; filename=\"Products - #{DateTime.now.strftime('%B %d %Y')}.xls\""
            end
            format.html
        end
    end

    def new
        @product = Product.new
    end

    def create
        @brand = Brand.all.where(id: product_params[:brand_id]).first
        if @brand.nil?
            @brand = Brand.new({name: product_params[:brand_id]})
            @brand.save
            @product = Product.new(product_params)
            @product.brand = @brand
            if @product.save
                redirect_to products_path
            else
                render :new
            end
        else
            @product = Product.new(product_params)
            if @product.save
                redirect_to products_path, notice: "#{@product.name} successfully created."
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
            redirect_to product_path(@product), notice: "#{@product.name} successfully updated."
        else
            render :edit
        end
    end

    def import
        if File.extname(params[:file].original_filename) == '.csv' and params[:file].content_type == 'text/csv' or params[:file].content_type == 'application/vnd.ms-excel'
            Product.import(params[:file])
            redirect_to products_path, notice: "Products have been imported."
        else
            redirect_to products_path, alert: "File given is invalid."
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
