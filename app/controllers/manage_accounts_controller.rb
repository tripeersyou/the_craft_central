class ManageAccountsController < ApplicationController
    def index
        @admins = Admin.paginate(page: params[:admins_page], per_page: 5)
        @staffs = Staff.paginate(page: params[:staffs_page], per_page: 5)
    end

    def authorize
       admin = Admin.find(params[:admin_id])
        if admin.id != 1
            if admin.status
               admin.status = false
            else
               admin.status = true
            end
            admin.save
            redirect_to manage_accounts_path, notice: "Changed the authorization level of #{admin.first_name}"
        else
            redirect_to manage_accounts_path, alert: "Cannot change the authorization level of #{admin.first_name}"
        end
    end

    def delete
        admin = Admin.find(params[:admin_id])
        name = admin.first_name
        if admin.id != 1
            admin.delete
            redirect_to manage_accounts_path, notice: "#{name}'s account has been deleted."
        else
            redirect_to manage_accounts_path, alert: "#{name}'s account cannot be deleted."
        end
    end
end
