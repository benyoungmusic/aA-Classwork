class UsersController < ApplicationController
    def index 
    
        # render plain: "I'm in the index action!"
        render json: User.all
    end

    def create
        user = User.new(params.require(:user).permit(:user_attributes_here))
        user.save!
        render json: user

    end

    def show
        render json:params
    end

    # def delete
    # end

    # def update
    # end



end 
