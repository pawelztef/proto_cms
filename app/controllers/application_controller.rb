class ApplicationController < ActionController::Base
  layout :layout_by_controller
  before_action :set_navigation

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :reader
      return root_path 
    elsif resource_or_scope == :user
      return  new_user_session_path 
    end
  end

  # TODO resue_from CanCan access denied
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to admin_dashboard_index
  end
  protected

  def layout_by_controller
    if devise_controller? && resource_name == :user
      "admin/layouts/admin_authentication"
    end
  end

  def set_navigation
    @roots_pages = Page.roots.where(status: :published).map { |p| p.becomes(Page) }
  end
end
