class Admin::SettingsController < Admin::AdminsController
  before_action :set_title

  def index
    @settings = Setting.instance
  end

  def update
    HomePage.set_as_homepage(settings_params[:home_page].to_i)
    byebug
    @settings = Setting.update(settings_params)
    redirect_to admin_settings_path
  end

  private
  def set_title
    @title = "Settings"
  end
  def settings_params
    params.require(:setting).permit(:company_name, :catch_phrase, :home_page)
  end
end
