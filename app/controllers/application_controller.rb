class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :set_locale

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

  def check_for_mobile
    session[:mobile_override] = params[:mobile] if params[:mobile]
    prepare_for_mobile if mobile_device?
  end

  def prepare_for_mobile
    prepend_view_path Rails.root.join("app", "mobile_views")
  end

  def mobile_device?
    if session[:mobile_override]
      session[:mobile_override] == "1"
    else
      (request.user_agent =~ /Mobile|webOS/) && (request.user_agent !~ /iPad/)
    end
  end
  helper_method :mobile_device?

  def record_not_found
    @wrapper_class = "details"
    render "pages/error_404", :status => 404
  end
end
