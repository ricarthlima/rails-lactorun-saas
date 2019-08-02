class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?
    
    def current_ability
        @current_ability ||= Ability.new(current_user)
    end
    
    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :bday])
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :bday)}
        end
end
