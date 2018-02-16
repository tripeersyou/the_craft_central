class ManageAccountsController < ApplicationController
    def index
        @admins = Admin.paginate(page: params[:admins_page], per_page: 1)
        @staffs = Staff.paginate(page: params[:staffs_page], per_page: 1)
    end
end
