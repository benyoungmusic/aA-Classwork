class UsersController < ApplicationController
    def index 
    
        # render plain: "I'm in the index action!"
        render json: User.all
    end

    def create
        user = User.new(whatever)
        
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: 422
        end
    end

    def show
        render json:params
    end

    def destroy
        user = User.find_by(id:params[:id])

        if user
            user.destroy
            render json:user
        else
            render json: "Error, not found", status: 404
            # render json: user.errors.full_messages, status: 404
        end
    end

    def update
        user = User.find(params[:id])

        if user.update(whatever)
            render json: user
        else
            render json: user.errors.full_messages, status: 404
        end
    end

    private

    def whatever
        params.require(:user).permit(:username)
    end

end 
