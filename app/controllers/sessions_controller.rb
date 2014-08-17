class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create

    @user = User.create(
                        first_name: params[:user][:first_name],
                        last_name: params[:user][:last_name],
                        email: params[:user][:email],
                        password: params[:user][:password],
                        password_confirmation: params[:user][:password_confirm] )
    if @user.valid?
      @user.save
      redirect_to 'new.js.erb'
    else
      render 'new'
    end
  end
end
