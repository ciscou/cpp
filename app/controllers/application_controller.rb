class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :admin_required!, :except => [:index, :show], :unless => :devise_controller?

  def admin_signed_in?
    user_signed_in? and current_user.admin?
  end
  helper_method :admin_signed_in?

  private

  def admin_required!
    authenticate_user! unless admin_signed_in?
  end
end
