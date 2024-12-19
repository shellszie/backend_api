class VerificationMailer < ApplicationMailer
  default from: "feedingreader1@gmail.com"

  def verification_email
    @email = params[:email]
    @url  = "http://localhost:3000/code" #TODO: make it environment flexible
    @code = params[:code]
    mail(to: @email, subject: "Feeding Reader - Verification Code")
  end
end
