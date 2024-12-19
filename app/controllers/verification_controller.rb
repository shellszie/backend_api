class VerificationController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @email = params[:email]
    @user = User.find_by(email: @email)
    if !@user.nil?
      @code = SecureRandom.alphanumeric(20)
      VerificationMailer.with(email: @email, code: @code).verification_email.deliver_now
      render :json=> :created
    else
      render :status => :unprocessable_entity
    end
  end

  def verification_params
    params.require(:verification).permit(:email)
  end
end
