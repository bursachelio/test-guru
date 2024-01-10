class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_user,
  :logged_in?

  before_action :store_location

  private

  def authenticate_user!
    unless current_user
    redirect_to login_path, alert: 'Are you a Guru? Verify your Email and Password please'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def store_location
    if (!request.fullpath.match("/login") && !request.xhr?)
      session[:previous_url] = request.original_url 
    end
  end
end
