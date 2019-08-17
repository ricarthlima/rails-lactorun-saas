class AppController < ApplicationController
    before_action :authenticate_user!
    
    def manager_verification
       if current_user.is_manager == nil then
           render :manager_decision
       else
           if current_user.is_manager then
               index_manager
           else
               index_normal
           end
       end
    end
    
    def set_manager
        is_manager = params[:is_manager]
        if is_manager == "false" then
            current_user.is_manager = false
        end
        current_user.save
        redirect_to app_path
    end
    
    def set_manager_true
        code = params[:code]
        if code == "3GQKEP9L" then
            current_user.is_manager = true
        else
            flash[:error] = "Código incorreto!"
        end
        redirect_to app_path
    end
    
    
    def index_normal
        @list_lactate_test = LactateTest.where("user_id = '"+current_user.id+"'").order(created_at: :desc)
        @lactate_test = LactateTest.new
        
        @lactate_test_info = LactateTest.new
        @open_lactate_test = params[:lactate_test]
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
        # Verificar se o LactateTest existe
        id = params["lactate_test"]["lactate_test_id"]
        testDel = LactateTest.find(id)
        
        # Deletar todas as Sprint filhas
        SprintTest.where("lactate_test_id = '" + id + "'").each do |sprint|
            sprint.delete
        end
        
        # Deletar o teste
        testDel.delete
        
        # Redirecionar para o app
        redirect_to app_path
    end
    
    def new_sprint_test
        sprint = SprintTest.new
        sprint.lactate_test_id = params["sprint_test"]["lactate_test_id"]
        sprint.order = params["order"].to_i
        sprint.distance = params["sprint_test"]["distance"]
        sprint.time = (params["minutes"].to_s.to_i * 60) + params["seconds"].to_s.to_i
        sprint.save
        redirect_to app_path(lactate_test: sprint.lactate_test_id)
    end
    
    def index_manager
        @list_my_teams = Team.where("user_id = '" + current_user.id + "'")
        @list_co_teams = TeamComanager.where("user_id = '" + current_user.id + "'")
        render :index_manager
    end
    
    def new_team
        team = Team.new
        team.user_id = params["team"]["user_id"]
        team.name = params["team"]["name"]
        team.obs = params["team"]["obs"]
        
        if !team.valid? then
            flash[:error] = "Não foi possível salvar as informações."
            
            if team.name == "" then
                flash[:list] = "É preciso inserir um nome.\n"
            end
        else
            team.save
        end
        
        redirect_to app_path
    end
end
