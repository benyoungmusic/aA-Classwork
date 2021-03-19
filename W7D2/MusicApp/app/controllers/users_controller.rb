class UsersController < ApplicationController
    
    def index
        @users = User.all
        render :index
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    def new
        @user = User.new
        render :new
        
    end

    def create
        @user = User.new(user_params)

        # LOGIN USERS HERE
        # if @user.save
        #     login!(@user)
        # end

    end


    private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end
