class Admins::SettingsController < Admins::AdminsController
  before_action :set_title

  def index
    @settings = Setting.instance
  end

  def update
    @settings = Setting.update(settings_params)
    redirect_to admins_settings_path
  end

  private
  def set_title
    @title = "Settings"
  end
  def settings_params
    params.require(:setting).permit(:company_name, :catch_phrase)
  end
end
