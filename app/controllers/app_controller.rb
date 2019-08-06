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
        @list_lactate_test = LactateTest.where("user_id = '"+current_user.id+"'")
        render :index
    end
end
