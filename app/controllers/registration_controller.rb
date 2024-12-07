class RegistrationController < ApplicationController

  def create
    logger.debug "in registration create: and attributes are #{user_params.inspect}"
    @user = User.new(user_params)
    if @user.save
      # redirect_to root_path, notice: "Successfully created account!"
      render json: @user
    else
      render :new
    end
  end

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
