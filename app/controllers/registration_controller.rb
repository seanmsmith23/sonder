class RegistrationController < ApplicationController
  skip_before_action :ensure_authenticated_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      first_name: params[:user][:first_name],
      last_name: params[:user][:last_name],
      email: params[:user][:email],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirm]
    )

    if @user.save
      redirect_to '/sessions/new', notice: "Thanks for registering!"
    else
      render 'new'
    end
  end
end