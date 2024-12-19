class VerificationController < ApplicationController
  skip_before_action :authorized, only: [:create, :verify]

  def create
    @email = params[:email]
    if !@email.nil?
      @code = SecureRandom.alphanumeric(20)
      VerificationMailer.with(email: @email, code: @code).verification_email.deliver_now
      ver = Verification.create!(email: @email, code: @code)
      if ver.valid?
        render :json=> :created
      else
        render :status => :unprocessable_entity
      end
    else
      render :status => :unprocessable_entity
    end
  end

  def verify
    debugger
    @codes = Verification.find_by(email: params[:email], code: params[:code])
    if !@codes.nil?
      render status: :ok
    else
      render status: :unauthorized
    end

  end

  def verification_params
    params.require(:verification).permit(:email)
  end
end
