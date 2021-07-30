class AuthController < ApplicationController
    skip_before_action :authorized, only: [:login]
    
    def login
        @user = User.find_by(email: login_params[:email])
        # using another variable for clarity, my other implementation did not read well
        renderable = {}
        puts params
        if @user && @user.authenticate(login_params[:password])
          token = encode_token({ user_id: @user.id })
          puts token
          renderable = { user: @user, token: token }
        else
          renderable = { error: 'Invalid Username or Password' }
        end
        
        render json: renderable
    end

    private 
    def login_params
        params.require(:user).permit(:email, :password)
    end
end