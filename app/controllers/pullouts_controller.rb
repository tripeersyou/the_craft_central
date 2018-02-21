class PulloutsController < ApplicationController
    before_action :set_store
    def new
        @pullout = @store.pullouts.new
    end

    def create

    end

    private
        def pullout_params
            params.require(:pullout).permit!
        end
        def set_store
            @store = Store.find(params[:store_id])
end     end
