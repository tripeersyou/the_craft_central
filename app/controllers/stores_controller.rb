class StoresController < ApplicationController
    before_action :set_store, only: [:show, :edit, :update]
    def index
        if !params[:sort_by]
            @stores = Store.paginate(page: params[:page], per_page: 9)
        else
            @stores = Store.paginate(page: params[:page], per_page: 9).order(params[:sort_by] + ' ASC')
        end
    end

    def new
        @store = Store.new
    end

    def create
        @store = Store.new(store_params)
        if @store.save
            redirect_to store_path(@store)
        else
            render :new
        end
    end

    def show
        @products = @store.store_products.paginate(page: params[:products_page], per_page: 5).order('created_at DESC')
        @deliveries = @store.deliveries.paginate(page: params[:deliveries_page], per_page: 5).order('created_at DESC')
        @pullouts = @store.pullouts.paginate(page: params[:pullouts_page], per_page: 5).order('created_at DESC')
        @transfers = @store.transfers.paginate(page: params[:transfers_page], per_page: 5).order('created_at DESC')
        @ending_inventories = @store.ending_inventories.paginate(page: params[:ending_inventories_page], per_page: 5).order('created_at DESC')

    end
    
    def edit
    end
    
    def update
        if @store.update(store_params)
            redirect_to store_path(@store)
        else
            render :edit
        end
    end

    private
        def store_params
            params.require(:store).permit!
        end
        def set_store
            @store = Store.find(params[:id])
        end

end
