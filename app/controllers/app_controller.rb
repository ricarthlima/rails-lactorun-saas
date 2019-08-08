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
        
        if !@lactate_test.valid? then
            flash[:error] = "Não foi possível salvar as informações."
            
            if @lactate_test.local == "" then
                flash[:list] = "É preciso inserir um local.\n"
            end
            
            if @lactate_test.date == nil then
                flash[:list] += "É preciso inserir uma data.\n"
            end
            
            if @lactate_test.time == nil then
                flash[:list] += "É preciso inserir um horário."
            end
        else
            @lactate_test.save
        end
        redirect_to app_path
    end
    
    def remove_lactate_test
        id = params["lactate_test"]["lactate_test_id"]
        testDel = LactateTest.find(id)
        testDel.delete
        redirect_to app_path
    end
end
