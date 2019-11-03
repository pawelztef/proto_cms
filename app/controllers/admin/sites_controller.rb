class Admin::SitesController < Admin::AdminsController
  before_action :set_title

  def index
    @site = Site.instance
  end

  def update
    HomePage.set_as_homepage(site_params[:home_page].to_i)
    byebug
    @site = Site.update(site_params)
    redirect_to admin_sites_path
  end

  private
  def set_title
    @title = "Settings"
  end
  def site_params
    params.require(:site).permit(:company_name, :catch_phrase, :home_page, :logo, :favicon)
  end
end
