class RegistrationController < ApplicationController
  skip_before_action :authorized, only: [:create, :update]

  rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record

  def create
    user = User.create!(user_params)
    @token = encode_token(user_id: user.id)
    render json: {
      user: user,
      token: @token
    }, status: :created
  end

  def update
    @user = User.find_by(email: params[:email])
    @token = encode_token(user_id: @user.id)
    if @user.update(user_params)
      render json: @token, status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:registration).permit(:email, :password, :password_confirmation)
  end

  def handle_invalid_record(e)
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end
end
