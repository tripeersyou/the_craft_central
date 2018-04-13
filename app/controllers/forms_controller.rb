class FormsController < ApplicationController
    def index
        @stores = Store.all
        if params[:store_id] and params[:store_id] != ""
            store = Store.find(params[:store_id])
            @ending_inventories = store.ending_inventories;
        else
            @ending_inventories = EndingInventory.all
        end
    end
    def products
        if params[:query]
            q_string = '%'+params[:query]+'%'
            @products = Product.where('name LIKE ? or sku LIKE ?', q_string, q_string)
            puts @products
        else
            @products = Product.all
        end
    end
    def store_products
        @stores = Store.all
        if params[:store_id]
            store = Store.find(params[:store_id])
            @store_products = store.store_products
        else
            @store_products = StoreProduct.all
        end
    end
end