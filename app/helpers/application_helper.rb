module ApplicationHelper
     #Para o login no modal!

    def resource_name
        :user
    end

    def resource
        @resource ||= User.new
    end

    def resource_class
      User
    end

    def devise_mapping
        @devise_mapping ||= Devise.mappings[:user]
    end
    
    
    def tokenizar_flash_list(str)
        return str.split("\n")
    end
end
