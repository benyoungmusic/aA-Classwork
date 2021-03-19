class ApplicationController < ActionController::Base
    helper_method :logged_in?

    def log_in_user!(user)
        session[:session_token] = user.reset_session_token!
    end

    def logout!(user)
        @current_user = nil
        session[:session_token] = nil
        user.reset_session_token!
    end

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def logged_in?
        !!current_user
    end


end