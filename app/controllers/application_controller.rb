class ApplicationController < ActionController::Base
  layout :layout_by_controller
  before_action :set_navigation

  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end

  # TODO resue_from CanCan access denied
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to admin_dashboard_index
  end
  protected

  def layout_by_controller
    if devise_controller? && resource_name == :user
      "admin_authentication"
    elsif devise_controller? && resource_name == :caregiver
      "front_authentication" 
    end
  end

  def set_navigation
    @roots_pages = Page.roots.where(status: :published)
  end
end
