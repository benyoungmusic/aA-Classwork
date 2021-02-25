class UsersController < ApplicationController
    def index 
    
        # render plain: "I'm in the index action!"
        render json: User.all
    end

    def create
        render json: params
    end

    def show
        render json:params
    end

    # def delete
    # end

    # def update
    # end

    

end 
