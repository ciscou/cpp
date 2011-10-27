class ApplicationController < ActionController::Base
  protect_from_forgery

  enable_authorization :unless => :devise_controller? do |exception|
    redirect_to new_user_session_path, :alert => exception.message
  end
end
