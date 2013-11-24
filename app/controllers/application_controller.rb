class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  private

  def current_user_is_admin?
    user_signed_in? && current_user.admin?
  end
  helper_method :current_user_is_admin?

  def ensure_admin_user
    unless current_user_is_admin?
      redirect_to root_url, alert: "No tiene permisos para realizar esa acción"
    end
  end

  def set_locale
    I18n.locale = params[:locale].presence || session[:locale].presence || I18n.default_locale
    session[:locale] = I18n.locale
  end

  def default_url_options(options = {})
    { :locale => I18n.locale }
  end

  def record_not_found
    @wrapper_class = "details"
    render "pages/404", :status => 404
  end
end
