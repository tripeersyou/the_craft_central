class PagesController < ApplicationController
    def dashboard
        if (params[:start_date] && params[:end_date]) && (params[:start_date] != "" && params[:end_date] != "")
            @start_of_month = params[:start_date]+ ' 00:00:00'
            @today = params[:end_date] + ' 23:59:59'
            @total_sales = EndingInventory.total_sales_time(@start_of_month, @today)
            @total_cogs = EndingInventory.total_cogs_time(@start_of_month, @today)
            @total_revenue = @total_sales - @total_cogs
        else
            @start_of_month = Date.today.at_beginning_of_month.strftime('%Y-%m-%d %H:%M:%S')
            @today = Time.now.at_end_of_day.strftime('%Y-%m-%d %H:%M:%S')
            @total_sales = EndingInventory.total_sales_time(@start_of_month, @today)
            @total_cogs = EndingInventory.total_cogs_time(@start_of_month, @today)
            @total_revenue = @total_sales - @total_cogs
        end
    end
    def account
    end
end
