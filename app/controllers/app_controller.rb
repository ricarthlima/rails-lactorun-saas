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
end
