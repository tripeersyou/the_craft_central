class FormsController < ApplicationController
    def index
        @stores = Store.all
        if params[:store_id] and params[:store_id] != " "
            store = Store.find(params[:store_id])            
            if (params[:start_date] && params[:end_date]) && (params[:start_date] != "" && params[:end_date] != "")
                @ending_inventories = store.ending_inventories.paginate(page: params[:page], per_page: 10).order('created_at DESC').where('created_at BETWEEN ? AND ?', params[:start_date], params[:end_date]);                
            else
                @ending_inventories = store.ending_inventories.paginate(page: params[:page], per_page: 10).order('created_at DESC');
            end
        else
            if (params[:start_date] && params[:end_date]) && (params[:start_date] != "" && params[:end_date] != "")
                @ending_inventories = EndingInventory.paginate(page: params[:page], per_page: 10).order('created_at DESC').where('created_at BETWEEN ? AND ?', params[:start_date], params[:end_date])
            else
                @ending_inventories = EndingInventory.paginate(page: params[:page], per_page: 10).order('created_at DESC')
            end
        end
    end
    def products
        if params[:query]
            q_string = '%'+params[:query]+'%'
            @products = Product.paginate(page: params[:page], per_page: 15).where('name LIKE ? or sku LIKE ?', q_string, q_string)
        else
            @products = Product.paginate(page: params[:page], per_page: 15)
        end
    end
    def store_products
        @stores = Store.all
        if params[:store_id] and params[:store_id] != " "
            @store = Store.find(params[:store_id])
            @store_products = @store.store_products.paginate(page: params[:page], per_page: 15)
        else
            @store_products = StoreProduct.paginate(page: params[:page], per_page: 15)
        end

        respond_to do |format|
            format.xls do
                headers["Content-Disposition"] =  "attachment; filename=\"Store Products - #{DateTime.now.strftime('%B %d %Y')}.xls\""
            end
            format.html
        end
    end
end