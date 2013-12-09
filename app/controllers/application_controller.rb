class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def not_athenticated
    redirect_to login_url, :alert => "First login to access this page."
  end
end
