class SessionsController < ApplicationController

    def new
        render :new 
    end

    def create
        user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if user
            redirect_to users_url(user)
        else
            flash.now[:errors] = ["Invalid Credentials"]
            render :new
        end
    end

    def destroy
        logout!
        redirect_to new_session_url
    end

end
