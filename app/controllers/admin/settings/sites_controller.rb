class Admin::Settings::SitesController < Admin::AdminsController
  before_action :set_title
  before_action :set_instance
  authorize_resource 

  def show
  end

  def update
    if @site.update(site_params)
      redirect_to admin_settings_site_path,
        notice: "Site setting was successfully updated."
    else 
      render admin_settings_site_path,
        alert: "There were issues while saving your settings."
    end
  end

  def destroy_img
    if params[:button] == "logo"
      @site.logo.purge
      redirect_to admin_settings_site_path,
        notice: "Logo image was successfully destroyed."
    elsif params[:button] == "favicon"
      @site.favicon.purge
      redirect_to admin_settings_site_path,
        notice: "Favicon image wase successfully destroyed."
    else
      redirect_to admin_settings_site_path,
        alert: "Action not recognized!"
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
    params.require(:site).permit(:company_name,
                                 :catch_phrase,
                                 :logo,
                                 :favicon,
                                 :home_page_id)
  end

end
