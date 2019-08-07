class AppController < ApplicationController
    before_action :authenticate_user!
    
    def manager_verification
       if current_user.is_manager == nil then
           render :manager_decision
       else
           if current_user.is_manager then
               render :dashboard_manager
           else
               index_normal
           end
       end
    end
    
    def set_manager
        is_manager = params[:is_manager]
        if is_manager == "true" then
            current_user.is_manager = true
        elsif is_manager == "false" then
            current_user.is_manager = false
        end
        current_user.save
        redirect_to app_path
    end
    
    def index_normal
        @list_lactate_test = LactateTest.where("user_id = '"+current_user.id+"'").order(created_at: :desc)
        @lactate_test = LactateTest.new
        render :index
    end
    
    def new_lactate_test
        @lactate_test = LactateTest.new
        @lactate_test.user_id = params["lactate_test"]["user_id"]
        @lactate_test.local = params["lactate_test"]["local"]
        @lactate_test.date = params["lactate_test"]["date"]
        @lactate_test.time = params["lactate_test"]["time"]
        @lactate_test.save
        redirect_to app_path
    end
end
