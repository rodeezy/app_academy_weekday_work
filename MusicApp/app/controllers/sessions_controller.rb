class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:email],
                                  params[:user][:password])
    if user.nil?
      flash.now[:errors] = ["Incorrect email and/or password"]
      render :new
    else
      login_user!(user)
      redirect_to users_url
    end
  end

  def destroy
    logout_user!
    redirect_to new_session_url
  end
end
