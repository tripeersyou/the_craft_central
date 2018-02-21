class StoresController < ApplicationController
    before_action :set_store, only: [:show, :edit, :update]
    def index
        if !params[:sort_by]
            @stores = Store.paginate(page: params[:page], per_page: 9)
        else
            @stores = Store.paginate(page: params[:page], per_page: 9).order(params[:sort_by + ' DESC'])
        end
    end

    def new
        @store = Store.new
    end

    def create
        store = Store.new(store_params)
        if store.save
            redirect_to store_path(store)
        else
            render :new
        end
    end

    def show
    end
    
    def edit
    end
    
    def update
        if @store.update(store_params)
            redirect_to store_path(@store)
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
