class Admin::SitesController < Admin::AdminsController
  before_action :set_title
  before_action :set_instance

  def index
  end

  def update
    HomePage.set_as_homepage(site_params[:home_page].to_i)
    @site = Site.update(site_params)
    redirect_to admin_sites_path, notice: "Site setting was successfully updated."
  end

  def destroy_img
    if params[:button] == "logo"
      @site.logo.purge
      redirect_to admin_sites_path, notice: "Logo image was successfully destroyed."
    elsif params[:button] == "favicon"
      @site.favicon.purge
      redirect_to admin_sites_path, notice: "Favicon image wase successfully destroyed."
    else
      redirect_to admin_sites_path, alert: "Action not recognized!"
    end
  end

  private

  def set_instance
    @site = Site.instance
  end
  def set_title
    @title = "Settings"
  end
  def site_params
    params.require(:site).permit(:company_name, :catch_phrase, :home_page, :logo, :favicon)
  end
end
