class SessionController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      @token = generate_jwt(user)
      render json: {
        user: user,
        token: @token
      }, status: :created
    end
  end

  def generate_jwt(user)
    payload = { user_id: user.id }
    JWT.encode(payload, Rails.application.secret_key_base)
  end

  def user_params
    params.permit(:email, :password)
  end
end
