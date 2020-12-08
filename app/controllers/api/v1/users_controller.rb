class API::V1::UsersController < ApplicationController
#     before_action :authenticate_user

    def index
        users = User.all 
        render json: users, include: :notes
    end 

    def create 
        user = User.create(user_params)
        if user.valid?
            render json: { user: UserSerializer.new(user) }, status: :created 
        else 
            render json: {error: "username is already taken" }, status: :not_acceptable
        end 
    end 

    private 

    def user_params
        params.require(:user).permit(:username, :password, :user_id )
    end 

end
