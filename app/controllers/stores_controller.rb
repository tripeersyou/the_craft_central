class StoresController < ApplicationController
    before_action :set_store, only: [:show, :edit, :update]
    def index
        if params[:store_sort] and params[:store_sort] != ""
            if params[:store_search] and params[:store_search] != ""
                q_string = '%'+params[:store_search]+'%'
                @stores = Store.paginate(page: params[:page], per_page: 9).where('name LIKE ?', q_string).order(params[:store_sort] + ' ASC')
            else
                @stores = Store.paginate(page: params[:page], per_page: 9).order(params[:store_sort] + ' ASC')
            end
        else
            if params[:store_search] and params[:store_search] != ""
                q_string = '%'+params[:store_search]+'%'
                @stores = Store.paginate(page: params[:page], per_page: 9).where('name LIKE ?', q_string)
            else
                @stores = Store.paginate(page: params[:page], per_page: 9)
            end
        end
    end

    def new
        @store = Store.new
    end

    def create
        @store = Store.new(store_params)
        if @store.save
            redirect_to store_path(@store), notice: "#{@store.name} successfully created"
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

        respond_to do |format|
            format.xls do
                headers["Content-Disposition"] =  "attachment; filename=\"Store Products #{@store.name} - #{DateTime.now.strftime('%B %d %Y')}.xls\""
            end
            format.html
        end
    end
    
    def edit
    end
    
    def update
        if @store.update(store_params)
            redirect_to store_path(@store), notice: "#{@store.name} successfully updated"
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
