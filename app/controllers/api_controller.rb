class ApiController < ApplicationController
    def products
        if params[:id]
            render json: Product.find(params[:id])
        else
            render json: nil
        end
    end

    def store_products
        if params[:id] && params[:store]
            render json: StoreProduct.where('store_id = ? AND product_id = ?', params[:store], params[:id]).first
        else
            render json: nil
        end
    end
end
