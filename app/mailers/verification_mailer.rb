class VerificationMailer < ApplicationMailer
  default from: "feedingreader1@gmail.com"

  def verification_email
    @user = params[:user]
    @url  = "http://localhost:3000/code"
    @code = params[:code]
    mail(to: @user.email, subject: "Verification Code")
  end
end
