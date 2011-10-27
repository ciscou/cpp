class ApplicationController < ActionController::Base
  protect_from_forgery

  enable_authorization :unless => :devise_controller? do |exception|
    redirect_to root_url, :alert => exception.message
  end
end
