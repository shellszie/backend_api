class ApplicationController < ActionController::API
  before_action :authorized
  before_action :cors_set_access_control_headers

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Headers'] = '*'
  end


  def encode_token(payload)
    JWT.encode(payload, Rails.application.secret_key_base)
  end

  def decoded_token
    header = request.headers['Authorization']
    if header
      token = header.split(" ")[1]
      begin
        JWT.decode(token, Rails.application.secret_key_base, true, algorithm: 'HS256')
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

  def authorized
    Rails.logger.debug " +++++++ in authorized"
    unless !!current_user
      render json: { message: 'Please log in' }, status: :unauthorized
    end
  end
end
