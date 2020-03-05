class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  helper_method :current_user,
                :logged_in?,
                :flash_message

  private

  def authenticate_user!
    unless current_user
      cookies[:target_url] = request.fullpath
      redirect_to login_path, alert: 'Войдите в систему!'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def flash_message(message)
    flash[:alert] = message
  end
end
