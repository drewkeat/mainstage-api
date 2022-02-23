class ApplicationController < ActionController::API
  before_action :authorized
  def jwt_secret
    Rails.application.credentials.jwt_secret
  end

  def encode_token(payload)
    JWT.encode(payload, jwt_secret)
  end

  def auth_header
    request.headers['Authorization']
  end
  
  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, jwt_secret, true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    unless logged_in?
      render json: ['Please log in'], status: :unauthorized
    end
  end
  
end