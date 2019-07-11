class ApplicationController < ActionController::Base
  layout :layout_by_controller

  # def after_sign_in_path_for(resource)
  #   if resource.class == User
  #     admin_dashboard_index_path
  #   elsif resource.class == Caregiver
  #     caregivers_path
  #   end
  # end
  def after_sign_in_path_for(resource)
    admin_dashboard_index_path
  end

  # def after_sign_out_path_for(resource)
  # byebug
  # if resource == 'Admin'
  #   byebug
  #   new_admin_session_path
  # elsif resource == 'Caregiver'
  #   byebug
  #   new_caregiver_session_path
  # else
  #   root_path 
  # end
  # request.referrer
  # case resource
  # when Admin  then  new_admin_session_path
  # when Caregiver then new_caregiver_session_path
  # end
  # end

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
end
