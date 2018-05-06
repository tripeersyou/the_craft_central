class PagesController < ApplicationController
    def dashboard
        if (params[:start_date] && params[:end_date]) && (params[:start_date] != "" && params[:end_date] != "")
            @start_of_month = params[:start_date]
            @today = params[:end_date]
            @total_sales = EndingInventory.total_sales_time(@start_of_month, @today);
            @total_revenue = EndingInventory.total_sales_time(@start_of_month, @today) - EndingInventory.total_cogs_time(@start_of_month, @today)
            @total_cogs = EndingInventory.total_cogs_time(@start_of_month, @today)
        else
            @start_of_month = Date.today.at_beginning_of_month.strftime('%Y-%m-%d')
            @today = Time.now.strftime('%Y-%m-%d')
            @total_sales = EndingInventory.total_sales_time(@start_of_month, @today);
            @total_revenue = EndingInventory.total_sales_time(@start_of_month, @today) - EndingInventory.total_cogs_time(@start_of_month, @today)
            @total_cogs = EndingInventory.total_cogs_time(@start_of_month, @today)
        end
    end
    def account
    end
end
