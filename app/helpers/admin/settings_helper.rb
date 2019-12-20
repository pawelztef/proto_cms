module Admin::SettingsHelper
  def set_active_class(resource_name)
    if params[:controller].include? resource_name
      return "pz-active"
    end
  end
end
