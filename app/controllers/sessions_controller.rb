class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:target_url]
    else
      flash.now[:alert] = 'Verify your Email and Password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:alert] = 'Вы вышли из системы'
    redirect_to login_path
  end
end
