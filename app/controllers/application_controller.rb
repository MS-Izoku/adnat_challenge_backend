# based off of standard Flatiron JWT boiler-plate auth

class ApplicationController < ActionController::API
    before_action :authorized

    # encode a token to give to the browser
    def encode_token(payload)
      JWT.encode(payload, 'my_special_secret')
    end
  
    # require the auth header for the configurable-obj of fetch requests
    # { Authorization: 'Bearer token' }
    def auth_header
      request.headers['Authorization']
    end
  
    # decode a JWT token 
    def decoded_token
      if auth_header
        token = auth_header.split(' ')[1]
        begin
          JWT.decode(token, 'my_special_secret', true, algorithm: 'HS256')
        rescue JWT::DecodeError
          nil
        end
      end
    end
  
    # check for the decoded token, then use the 1st part of it to search for the user_id
    def logged_in_user
      if decoded_token
        user_id = decoded_token[0]['user_id']
        @user = User.find_by(id: user_id)
      end
    end
  
    # login check
    def logged_in?
      !!logged_in_user
    end
  
    # a renderable json message displayed when the user is unauthorized
    def authorized
      render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end
  
end
