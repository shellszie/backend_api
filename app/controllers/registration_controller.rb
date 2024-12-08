class RegistrationController < ApplicationController
  skip_before_action :authorized, only: [:create]

  rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record

  def create
    Rails.logger.debug "+++++++ in create"
    user = User.create!(user_params)
    @token = encode_token(user_id: user.id)
    render json: {
      user: user,
      token: @token
    }, status: :created
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def handle_invalid_record(e)
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end
end
