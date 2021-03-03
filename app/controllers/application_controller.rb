class ApplicationController < ActionController::Base
    before_action :require_login

    def require_login
        if session[:current_user]
            @current_user = session[:current_user]
        else 
            redirect_to login_path, :alert => 'Sign up or Log in to see the events!'
        end
    end
end
