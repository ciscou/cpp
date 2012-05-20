class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  enable_authorization :unless => :devise_controller? do |exception|
    redirect_to root_url, :alert => exception.message
  end

  private

  def record_not_found
    @wrapper_class = "details"
    render "pages/404", :status => 404
  end
end
