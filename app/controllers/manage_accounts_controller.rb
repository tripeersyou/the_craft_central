class ManageAccountsController < ApplicationController
    def index
        @admins = Admin.paginate(page: params[:admins_page], per_page: 5)
        @staffs = Staff.paginate(page: params[:staffs_page], per_page: 5)
    end

    def authorize
       admin = Admin.find(params[:admin_id])
       if admin.status
        admin.status = false
       else
        admin.status = true
       end
       admin.save
       redirect_to manage_accounts_path
    end
end
