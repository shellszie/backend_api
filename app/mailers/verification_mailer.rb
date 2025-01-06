class VerificationMailer < ApplicationMailer
  default from: "feedingreader1@gmail.com"

  def verification_email
    @email = params[:email]
    @url  = Rails.env === "development" ? "http://192.168.0.29:3000/code" : "https://protected-island-42169-af68303f7729.herokuapp.com/code"
    @code = params[:code]
    mail(to: @email, subject: "Feeding Reader - Verification Code")
  end
end
