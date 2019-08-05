class AppController < ApplicationController
    before_action :authenticate_user!
    
    def manager_verification
       if current_user.is_manager == nil then
           render :manager_decision
       else
           if current_user.is_manager then
               render :dashboard_manager
           else
               render :index
           end
       end
    end
    
    def set_manager
        print("\n--------------\n")
        print(params[:is_manager])
        print("\n--------------\n")
        is_manager = params[:is_manager]
        if is_manager == "true" then
            current_user.is_manager = true
        elsif is_manager == "false" then
            current_user.is_manager = false
        end
        current_user.save
        redirect_to app_path
    end
end
