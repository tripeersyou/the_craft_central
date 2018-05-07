class StaffsController < ApplicationController
    before_action :set_staff, only: [:edit, :destroy, :update]
    def new
        @staff = Staff.new
    end
    def create
        @staff = Staff.new(staff_params)
        if @staff.save
            redirect_to manage_accounts_path, notice: "Staff Account: #{@staff.email} has been successfully created."
        else
            render :new
        end
    end
    def edit
    end
    def update
        if @staff.update(staff_params)
            redirect_to manage_accounts_path, notice: "Staff Account: #{@staff.email} has been successfully updated."
        else
            render :edit
        end
    end
    def destroy
        if @staff.present?
            name = @staff.first_name
            @staff.delete
            redirect_to manage_accounts_path, notice: "#{name}'s account has been deleted'"
        else
            redirect_to manage_accounts_path
        end
    end
    private 
        def staff_params
            params.require(:staff).permit!
        end
        def set_staff
            @staff = Staff.find(params[:id])
        end
end
