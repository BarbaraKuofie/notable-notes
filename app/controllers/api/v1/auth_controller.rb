
class API::V1::AuthController < ApplicationController

    def index 
        users = User.all 
        render json: users 
    end 


    def create
      user = User.find_by(username: params[:username])
  
      if user && user.authenticate(params[:password])
        payload = { user_id: user.id }
  
        token = JWT.encode(payload, 'secret_code', 'HS256')
  
  
        # create a jwt
  
        render json: { user: {id: user.id, username: user.username}, token: token }
      else
        render json: { error: 'Invalid username or password.' }, status: 401
      end
    end
  
  
    def show
      token = request.headers[:Authorization].split(' ')[1]
      decoded_token = JWT.decode(token, 'secret_code' , true, { algorithm: 'HS256' })
      user_id = decoded_token[0]['user_id']
      user = User.find(user_id)
  
      render json: { user: {id: user.id, username: user.username} }
    end
  end
  