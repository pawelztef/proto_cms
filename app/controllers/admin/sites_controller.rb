class Admin::SitesController < Admin::AdminsController
  before_action :set_title
  before_action :set_instance

  def index
  end

  def update
    #@site.home_page = Page.find(params[:home_page_id]).set_as_home if params[:home_page_id]
    if params[:home_page_id]
      Page.find(params[:home_page_id]).set_as_home
      @site.home_page = HomePage.instance
    end
    @site.update(site_params)
    redirect_to admin_sites_path, notice: "Site setting was successfully updated."
  end

  def settings_forms
    respond_to do |format|
      format.js
    end
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
    params.require(:site).permit(:company_name,
                                 :catch_phrase,
                                 :logo,
                                 :favicon,
                                 :home_page_id,
                                 blog_attributes: [:title,
                                                   :visible,
                                                   :permalink,
                                                   :commentable,
                                                   :max_comment_nesting,
                                                   :id,
                                                   :_destroy])
  end
end
